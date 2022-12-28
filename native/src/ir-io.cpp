#include <Arduino.h>
#include <IRrecv.h>
#include <IRremoteESP8266.h>
#include <IRutils.h>
#include <IRsend.h>

#include "ir-io.h"

IRrecv* ir_recv;
IRsend* ir_send_out;
IRsend* ir_send_in;
decode_results results;

void setupIR(uint16_t rcv_pin, uint16_t send_in_pin, uint16_t send_out_pin)
{
    ir_recv = new IRrecv(rcv_pin);
    ir_send_out = new IRsend(send_out_pin);
    ir_send_in = new IRsend(send_in_pin);

    ir_recv->enableIRIn();
    ir_send_in->begin();
    ir_send_out->begin();
}

uint64_t decodeIR()
{
    if (!ir_recv->decode(&results))
        return 0;

    Serial.println(resultToHumanReadableBasic(&results));
    ir_recv->resume();

    return results.value;
}

namespace IR
{
    void turnReceiverOn()
    {
        ir_send_out->sendNEC(IR_YAMAHA_ON);
        delay(1000);
        ir_send_out->sendNEC(IR_YAMAHA_D_TV);
    }

    void turnReceiverOff()
    {
        ir_send_out->sendNEC(IR_YAMAHA_OFF);
        ir_send_out->sendNEC(IR_YAMAHA_REPEAT);
        ir_send_out->sendNEC(IR_YAMAHA_REPEAT);
    }

    void turnProjectorOn()
    {
        ir_send_in->sendNEC(IR_BENQ_ON);
    }

    void turnProjectorOff()
    {
        ir_send_in->sendNEC(IR_BENQ_OFF);
        delay(1000);
        ir_send_in->sendNEC(IR_BENQ_OFF);
    }
}
