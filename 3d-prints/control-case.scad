pcb_w = 57.15;
pcb_l = 53.34;
pcb_thickness = 1.55;
pcb_corner_r = 2.29;
pcb_hole_r = 1.35;
pcb_hole_dist = 2.67;
pcb_hole_ul_x = 11.05;
pcb_hole_ul_y = 7.11;

ctrl_h = 17.4;
ctrl_bottom_pins_h = 2;

wall_thickness = 1.2; // 3x0.4

$fn=30;

// Derived values
dome_r = pcb_hole_dist + wall_thickness/2;
dome_h = ctrl_bottom_pins_h + 1;

case_pcb_gap = 0.5;
case_w_overlap = 6;
case_l = pcb_l + 2*case_pcb_gap;
case_w = pcb_w + 2*case_pcb_gap + 2*case_w_overlap;
case_bottom_h = ctrl_h + dome_h;
case_top_h = 1;

// print_bottom();
// print_bottom_preview();
print_top();
// show_both();

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

module CaseEdge(pos, h, thickness) {
  translate(pos) union() {
    difference() {
      sphere(r=thickness);
      translate([0,0,thickness])
        cube([2*thickness,2*thickness,2*thickness], center=true);
    }
    translate([0,0,h - 0.1]) cylinder(r=thickness, h=0.1);
  }
}

module RoundedBoxCase(w, l, h, thickness) {
  difference() {
    hull() {
      CaseEdge([0, 0], h, thickness);
      CaseEdge([0, l], h, thickness);
      CaseEdge([w, 0], h, thickness);
      CaseEdge([w, l], h, thickness);
    }
    cube([w, l, 2*h]);
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

    translate([pwr_hole_x, case_l, pwr_hole_z])
      rotate([90])
        rounded_hole(pwr_hole_w, pwr_hole_h);

    // IR_OUT 2
    io2_hole_w = 7.4;
    io2_hole_h = 6;
    io2_hole_x = 40.8;
    io2_hole_z = 0;

    translate([io2_hole_x, case_l, io2_hole_z])
      rotate([90])
        rounded_hole(io2_hole_w, io2_hole_h);

    // USB
    usb_hole_w = 7.56;
    usb_hole_h = 2.92;
    usb_hole_x = 34.5;
    usb_hole_z = 12.45;

    translate([usb_hole_x, case_l, usb_hole_z])
      rotate([90])
        rounded_hole(io2_hole_w, io2_hole_h, wall_thickness);

    // Switch
    switch_w = 13;
    switch_x = 33.8;
    switch_z = 11.92 / 2;
    switch_r = 3; // d=5.92

    translate([switch_x, case_l+2*wall_thickness, switch_z])
      rotate([90])
        cylinder(r=switch_r, h=3*wall_thickness);
  }
}

module Bottom() {
  translate([wall_thickness, wall_thickness, wall_thickness])
    difference() {
      union() {
        translate([-case_w_overlap,0,0])
          RoundedBoxCase(case_w, case_l, case_bottom_h, wall_thickness);

        // domes
        translate([case_pcb_gap, case_pcb_gap]) union() {
          translate([pcb_hole_dist, pcb_hole_dist])             cylinder(r=dome_r, h=dome_h);
          translate([pcb_hole_ul_x, pcb_l-pcb_hole_ul_y])       cylinder(r=dome_r, h=dome_h);
          translate([pcb_w-pcb_hole_dist, pcb_l-pcb_hole_dist]) cylinder(r=dome_r, h=dome_h);
          translate([pcb_w-pcb_hole_dist, pcb_hole_dist])       cylinder(r=dome_r, h=dome_h);
        }
      }

      translate([case_pcb_gap, case_pcb_gap]) union() {
        // screw holes
        screw_r = 1.25;
        translate([pcb_hole_dist, pcb_hole_dist, -2*wall_thickness])
          cylinder(r=screw_r, h=dome_h+4*wall_thickness);
        translate([pcb_hole_ul_x, pcb_l - pcb_hole_ul_y, -2*wall_thickness])
          cylinder(r=screw_r, h=dome_h+4*wall_thickness);
        translate([pcb_w - pcb_hole_dist, pcb_l - pcb_hole_dist, -2*wall_thickness])
          cylinder(r=screw_r, h=dome_h+4*wall_thickness);
        translate([pcb_w - pcb_hole_dist, pcb_hole_dist, -2*wall_thickness])
          cylinder(r=screw_r, h=dome_h+4*wall_thickness);

        // nut sinks
        nut_d = 5; // orig: d=4.92;
        nut_ro = nut_d/sqrt(3);
        nut_h = 2; // orog: 1.82
        translate([pcb_hole_dist, pcb_hole_dist, -wall_thickness-0.01])
          cylinder(r=nut_ro, h=nut_h, $fn=6);
        translate([pcb_hole_ul_x, pcb_l - pcb_hole_ul_y, -wall_thickness-0.01])
          cylinder(r=nut_ro, h=nut_h, $fn=6);
        translate([pcb_w - pcb_hole_dist, pcb_l - pcb_hole_dist, -wall_thickness-0.01])
          cylinder(r=nut_ro, h=nut_h, $fn=6);
        translate([pcb_w - pcb_hole_dist, pcb_hole_dist, -wall_thickness-0.01])
          cylinder(r=nut_ro, h=nut_h, $fn=6);

        // floor holes
        floor_hole_d = 5;
        for (x=[0:5]) {
          translate([pcb_w * (x+1.5)/8, pcb_l * 0.5/8, -2*wall_thickness])
            cylinder(d=floor_hole_d, h=3*wall_thickness);
        }

        for (y=[1:2:5]) for (x=[0:8]) {
          translate([pcb_w * x/8, pcb_l * (y+0.5)/8, -2*wall_thickness])
            cylinder(d=floor_hole_d, h=3*wall_thickness);
        }

        for (y=[2:2:4]) for (x=[1:8]) {
          translate([pcb_w * (x-0.5)/8, pcb_l * (y+0.5)/8, -2*wall_thickness])
            cylinder(d=floor_hole_d, h=3*wall_thickness);
        }

        translate([pcb_w * (0.5)/8, pcb_l * (6.5)/8, -2*wall_thickness])
          cylinder(d=floor_hole_d, h=3*wall_thickness);

        for (x=[3:8]) {
          translate([pcb_w * (x-0.5)/8, pcb_l * (6.5)/8, -2*wall_thickness])
            cylinder(d=floor_hole_d, h=3*wall_thickness);
        }

        for (x=[3:6]) {
          translate([pcb_w * (x)/8, pcb_l * (7.5)/8, -2*wall_thickness])
            cylinder(d=floor_hole_d, h=3*wall_thickness);
        }
      }

      Holes();

      // wallmount holes
      wm_screw_d = 3;
      translate([-0.5*case_w_overlap, case_w_overlap, -2*wall_thickness])
        cylinder(d = wm_screw_d + 0.1, h = 4*wall_thickness);
      translate([-0.5*case_w_overlap, case_l - case_w_overlap, -2*wall_thickness])
        cylinder(d = wm_screw_d + 0.1, h = 4*wall_thickness);
      translate([case_w - 1.5*case_w_overlap, case_w_overlap, -2*wall_thickness])
        cylinder(d = wm_screw_d + 0.1, h = 4*wall_thickness);
      translate([case_w - 1.5*case_w_overlap, case_l - case_w_overlap, -2*wall_thickness])
        cylinder(d = wm_screw_d + 0.1, h = 4*wall_thickness);
    }
}

module Top() {
  inlet_h = 3;

  translate([wall_thickness, wall_thickness, -case_top_h-wall_thickness])
    difference() {
      translate([0, 0, case_top_h])
        difference() {
          translate([-case_w_overlap, 0, 0])
          rotate_about_pt([0,180,0], pt=[case_w/2, case_l/2])
          union() {
            // Outer box
            RoundedBoxCase(case_w, case_l, case_top_h, wall_thickness);

            // Inlet
            difference() {
              hull() {
                cube([case_w, case_l, case_top_h + inlet_h]);
                translate([inlet_h/4, inlet_h/4])
                  cube([
                    case_w - inlet_h/2,
                    case_l - inlet_h/2,
                    case_top_h + 1.5*inlet_h]);
              }

              translate([wall_thickness, wall_thickness, -1])
                cube([
                  case_w - 2*wall_thickness,
                  case_l - 2*wall_thickness,
                  2*(case_top_h+inlet_h)
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
          esp_hole_l = case_w + 2;
          esp_hole_x = 24.37;
          translate([esp_hole_x-1, -1, -case_top_h-0.1])
            mirror([0,0,1])
              cube([esp_hole_w, esp_hole_l, case_bottom_h]);
        }
      Holes();
    }
}

module print_bottom() {
  translate([0, 5])
    Bottom();
}

module print_bottom_preview() {
  intersection()
  {
    print_bottom();
    translate([-case_w_overlap,0,0])
      cube([28+case_w_overlap,15,13]);
  }
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
  translate([0,0,case_bottom_h+case_top_h+2*wall_thickness+15])
    Top();

  // The controllers hull:
  #translate([case_pcb_gap+wall_thickness, case_pcb_gap+wall_thickness, 3+wall_thickness+0.01]) cube([pcb_w, pcb_l, ctrl_h]);
}

