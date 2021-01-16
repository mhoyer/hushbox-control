#ifndef InfraredCtrl_h
#define InfraredCtrl_h

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

#define RECV_PIN 4
#define SEND_OUT_PIN 2
#define SEND_IN_PIN 15

void ir_setup(void);
uint64_t ir_decode(void);

void ir_turn_receiver_on();
void ir_turn_projector_on();
void ir_turn_receiver_off();
void ir_turn_projector_off();

#endif
