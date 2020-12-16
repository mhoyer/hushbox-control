#include <Arduino.h>
#include <IRrecv.h>
#include <IRremoteESP8266.h>
#include <IRutils.h>
#include <IRsend.h>
#include <InfraredCtrl.h>

IRrecv ir_recv(RECV_PIN);
IRsend ir_send_out(SEND_OUT_PIN);
IRsend ir_send_in(SEND_IN_PIN);
decode_results results;

void ir_setup()
{
  ir_recv.enableIRIn();
  ir_send_in.begin();
  ir_send_out.begin();
}

uint64_t ir_decode()
{
  if (!ir_recv.decode(&results))
  {
    return 0;
  }
  ir_recv.resume();

  return results.value;
}


  // if (results.value == 0xCA15E)
  // {
  //   // ir_send_in.sendNEC(IR_YAMAHA_OFF);
  //   delay(400);
  //   ir_send_out.sendNEC(IR_YAMAHA_OFF);
  // }
  // else if(results.value == 0xCF00F)
  // {
  //   Serial.println("MENU");
  //   // ir_send_in.sendNEC(IR_YAMAHA_ON);
  //   delay(400);
  //   ir_send_out.sendNEC(IR_YAMAHA_ON);
  // }
  // else
  // {
  //   Serial.println(resultToHumanReadableBasic(&results));
  // }