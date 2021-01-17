#ifndef IR_IO_H
#define IR_IO_H

#include <stdint.h>

#define IR_YAMAHA_ON 0x5EA1B847
#define IR_YAMAHA_OFF 0x5EA17887
#define IR_YAMAHA_UP 0x5EA158A7
#define IR_YAMAHA_DOWN 0x5EA1D827
#define IR_YAMAHA_DVD 0x5EA1837C
#define IR_YAMAHA_D_TV 0x5EA12AD5

#define IR_BENQ_ON 0xCF20D
#define IR_BENQ_OFF 0xC728D
#define IR_BENQ_BACK 0xCA15E
#define IR_BENQ_MENU 0xCF00F

void setupIR(uint16_t rcv_pin, uint16_t send_in_pin, uint16_t send_out_pin);
uint64_t decodeIR(void);

namespace IR
{
    void turnReceiverOn();
    void turnProjectorOn();
    void turnReceiverOff();
    void turnProjectorOff();
}

#endif
