pcb_width = 57.15;
pcb_length = 53.34;
pcb_thickness = 1.55;
pcb_corner_radius = 2.29;
pcb_hole_radius = 1.35;
pcb_hole_dist = 2.67;
pcb_hole_ul_x = 11.05;
pcb_hole_ul_y = 7.11;

ctrl_height = 17.4;
ctrl_bottom_pins_height = 2;

wall_thickness = 1.2;

$fn=30;

// Derived values
dome_r = pcb_hole_dist + wall_thickness/2;
dome_h = ctrl_bottom_pins_height + 1;

case_pcb_gap = 0.5;
case_length = pcb_length + 2*case_pcb_gap;
case_width = pcb_width + 2*case_pcb_gap;
case_bottom_height = ctrl_height + dome_h;
case_top_height = 1;

//print_bottom();
//print_top();
show_both();

module rounded_hole(w, h, thickness=wall_thickness/2) {
  translate([0,0,-2*thickness])
    linear_extrude(5*thickness) 
      offset(r=thickness)
        square([w, h]);
}

module rotate_about_pt(a, v, pt) {
    translate(pt)
        rotate(a,v)
            translate(-pt)
                children();   
}

module CaseEdge(pos, height, thickness) {
  translate(pos) union() {
    difference() {
      sphere(r=thickness);
      translate([0,0,thickness])
        cube([2*thickness,2*thickness,2*thickness], center=true);
    }
    translate([0,0,height-.1]) cylinder(r=thickness, h=.1);
  }
}

module RoundedBoxCase(width, length, height, thickness) {
  difference() {
    hull() {
      CaseEdge([0, 0],          height, thickness);
      CaseEdge([0, length],     height, thickness);
      CaseEdge([width, 0],      height, thickness);
      CaseEdge([width, length], height, thickness);
    }
    cube([width, length, 2*height]);
  }
}

module Holes() {
  pcb_dome_offset = pcb_thickness + dome_h;
  
  translate([case_pcb_gap, case_pcb_gap, pcb_dome_offset]) union() {
    // TMP TO-92 (DS18B20)
    temp_hole_w = 6;
    temp_hole_h = 4;
    temp_hole_x = 17;
    temp_hole_z = 0;
    
    translate([temp_hole_x, 0, temp_hole_z]) 
      rotate([90])
        rounded_hole(temp_hole_w, temp_hole_h);

    // IR_IN
    ii_hole_w = 9.95;
    ii_hole_h = 6;
    ii_hole_x = 28.5;
    ii_hole_z = 0;
    
    translate([ii_hole_x, 0, ii_hole_z]) 
      rotate([90])
        rounded_hole(ii_hole_w, ii_hole_h);

    // IR_OUT 1
    io1_hole_w = 7.4;
    io1_hole_h = 6;
    io1_hole_x = 40.8;
    io1_hole_z = 0;
    
    translate([io1_hole_x, 0, io1_hole_z]) 
      rotate([90])
        rounded_hole(io1_hole_w, io1_hole_h);

    // Power hole
    pwr_hole_w = 8.95;
    pwr_hole_h = 8.95;
    pwr_hole_x = 14.0;
    pwr_hole_z = 11 - pwr_hole_h;
    
    translate([pwr_hole_x, case_length, pwr_hole_z])
      rotate([90])
        rounded_hole(pwr_hole_w, pwr_hole_h);
    
    // IR_OUT 2
    io2_hole_w = 7.4;
    io2_hole_h = 6;
    io2_hole_x = 40.8;
    io2_hole_z = 0;
    
    translate([io2_hole_x, case_length, io2_hole_z]) 
      rotate([90])
        rounded_hole(io2_hole_w, io2_hole_h);
    
    // USB
    usb_hole_w = 7.56;
    usb_hole_h = 2.92;
    usb_hole_x = 34.5;
    usb_hole_z = 12.45;
    
    translate([usb_hole_x, case_length, usb_hole_z]) 
      rotate([90])
        rounded_hole(io2_hole_w, io2_hole_h, wall_thickness);
  }
}

module Bottom() {
  translate([wall_thickness, wall_thickness, wall_thickness]) 
    difference() {
      union() {
        RoundedBoxCase(case_width, case_length, case_bottom_height, wall_thickness);
        
        // domes
        translate([case_pcb_gap, case_pcb_gap]) union() {
          translate([pcb_hole_dist, pcb_hole_dist])                      cylinder(r=dome_r, h=dome_h);
          translate([pcb_hole_ul_x, pcb_length-pcb_hole_ul_y])           cylinder(r=dome_r, h=dome_h);
          translate([pcb_width-pcb_hole_dist, pcb_length-pcb_hole_dist]) cylinder(r=dome_r, h=dome_h);
          translate([pcb_width-pcb_hole_dist, pcb_hole_dist])            cylinder(r=dome_r, h=dome_h);
        }
      }

      translate([case_pcb_gap, case_pcb_gap]) union() {
        // screw holes
        screw_r = 1.25;
        translate([pcb_hole_dist, pcb_hole_dist, -2*wall_thickness])                      cylinder(r=screw_r, h=dome_h+4*wall_thickness);
        translate([pcb_hole_ul_x, pcb_length-pcb_hole_ul_y, -2*wall_thickness])           cylinder(r=screw_r, h=dome_h+4*wall_thickness);
        translate([pcb_width-pcb_hole_dist, pcb_length-pcb_hole_dist, -2*wall_thickness]) cylinder(r=screw_r, h=dome_h+4*wall_thickness);
        translate([pcb_width-pcb_hole_dist, pcb_hole_dist, -2*wall_thickness])            cylinder(r=screw_r, h=dome_h+4*wall_thickness);
      
        // nut sinks
        nut_r = 5/2; // orig: d=4.92;
        nut_h = 2; // orog: 1.82
        translate([pcb_hole_dist, pcb_hole_dist, -wall_thickness])
          cylinder(r=nut_r, h=nut_h, $fn=6);
        translate([pcb_hole_ul_x, pcb_length-pcb_hole_ul_y, -wall_thickness])
          cylinder(r=nut_r, h=nut_h, $fn=6);
        translate([pcb_width-pcb_hole_dist, pcb_length-pcb_hole_dist, -wall_thickness])
          cylinder(r=nut_r, h=nut_h, $fn=6);
        translate([pcb_width-pcb_hole_dist, pcb_hole_dist, -wall_thickness])
          cylinder(r=nut_r, h=nut_h, $fn=6);
      }

      Holes();
    }
}

module Top() {
  inlet_height = 3;

  translate([wall_thickness, wall_thickness, -case_top_height-wall_thickness]) 
    difference() {
      translate([0, 0, case_top_height]) 
        difference() {
          rotate_about_pt([0,180,0], pt=[case_width/2, case_length/2]) 
          union() {
            // Outer box
            RoundedBoxCase(case_width, case_length, case_top_height, wall_thickness);
            
            // Inlet
            difference() {
              hull() {
                cube([case_width, case_length, case_top_height + inlet_height]);
                translate([inlet_height/4, inlet_height/4]) 
                  cube([
                    case_width - inlet_height/2,
                    case_length - inlet_height/2,
                    case_top_height + 1.5*inlet_height]);
              }
              
              translate([wall_thickness, wall_thickness, -1]) 
                cube([
                  case_width - 2*wall_thickness,
                  case_length - 2*wall_thickness,
                  2*(case_top_height+inlet_height)
                ]);
            }
          }
          
          // Fan holes:
          fan_hole_w = 5.72;
          fan_hole_h = 22;
          fan_hole_x = 5.93;
          fan_hole_y = 4.92;
          
          translate([
              fan_hole_x - wall_thickness + case_pcb_gap, 
              fan_hole_y - wall_thickness + case_pcb_gap,
              0])
            rounded_hole(fan_hole_w, fan_hole_h);
            
          // ESP
          esp_hole_w = 28.15 + 2;
          esp_hole_l = case_width + 2;
          esp_hole_x = 24.37;
          translate([esp_hole_x-1, -1, -case_top_height-0.1])
            mirror([0,0,1])
              cube([esp_hole_w, esp_hole_l, case_bottom_height]);
        }
      Holes();
    }
}

module print_bottom() {
  translate([0, 5])
    Bottom();
}

module print_top() {
  translate([0, -5])
  rotate([180])
    Top();
}

module show_both() {
  color("yellow", alpha=0.6) 
    Bottom();
  
  color("green", alpha=0.6) 
  translate([0,0,case_bottom_height+case_top_height+2*wall_thickness+10])
    Top();

  // The controllers hull: 
//  #translate([case_pcb_gap+wall_thickness, case_pcb_gap+wall_thickness, 3+wall_thickness]) cube([pcb_width, pcb_length, ctrl_height]);
}

