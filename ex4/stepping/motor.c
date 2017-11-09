#define EXTIO_SCAN_ASCII (*(volatile unsigned int *)0x0310)
#define EXTIO_SCAN_REQ (*(volatile unsigned int *)0x030c)
#define EXTIO_SCAN_STROKE (*(volatile unsigned int *)0x0308)

#define SCAN_STRORING (unsigned int)0xffffffff

#define EXTIO_PRINT_STROKE (*(volatile unsigned int *) 0x0300)
#define EXTIO_PRINT_ASCII  (*(volatile unsigned int *) 0x0304)

#define TRUE    0x1
#define FALSE   0x0

#define GPIO0 (*(volatile unsigned int *) 0x0320)

void my_motor1();
void my_motor2();
void ext_out(); 
void my_scan();

main() {
  unsigned int i;
  unsigned int str[10];
  while(1){
    my_scan(str);
    if(*str == 'R'){
      for(i = 0 ; i < 10; ++i)
        my_motor2();
    }else if(*str == 'L'){
      for(i = 0 ; i < 10; ++i)
        my_motor1();
    }
  } 
} 
 
void my_motor1() {
  ext_out(1); 
  ext_out(2); 
  ext_out(4); 
  ext_out(8); 
} 
void my_motor2() {
  ext_out(8); 
  ext_out(4); 
  ext_out(2); 
  ext_out(1); 
} 
 
void ext_out(unsigned int num) {
  unsigned int i;

  GPIO0 = num; 
}

void my_scan(str)
     unsigned int *str;
{
    EXTIO_SCAN_STROKE = (unsigned int)0x00000000;
    EXTIO_SCAN_REQ = (unsigned int)0x00000001;
    EXTIO_SCAN_STROKE = (unsigned int)0x00000001;

    EXTIO_SCAN_STROKE = (unsigned int)0x00000000;
    EXTIO_SCAN_STROKE = (unsigned int)0x00000001;
    while (EXTIO_SCAN_ASCII == SCAN_STRORING) {
      EXTIO_SCAN_STROKE = (unsigned int)0x00000000;
      EXTIO_SCAN_STROKE = (unsigned int)0x00000001;
    }

    while ((*str = EXTIO_SCAN_ASCII) != (unsigned int)0x3e) {    // 0x3e=RETURN
      if ((*str >= 1) && (*str <= 26)) {
  *str = 'A' + *str - 1;
      } else if ((*str >= 48) && (*str <= 57)) {
  *str = '0' + *str - 48;
      } else {
  if (*str == 0) {
    *str = '@';
  } else if (*str == 27) {
    *str = '[';
  } else if (*str == 29) {
    *str = ']';
  } else if ((*str >= 32) && (*str <= 47)) {
    *str = ' ' + *str - 32;
  } else if (*str == 58) {
    *str = '?';
  } else if (*str == 59) {
    *str = '=';
  } else if (*str == 60) {
    *str = ';';
  } else if (*str == 61) {
    *str = ':';
  } else if (*str == 62) {
    *str = '\n';
  } else {
    *str = '@';
  }
      }
      EXTIO_SCAN_STROKE = (unsigned int)0x00000000;
      EXTIO_SCAN_STROKE = (unsigned int)0x00000001;
      str++;
    }
    *str = '\0';

    EXTIO_SCAN_STROKE = (unsigned int)0x00000000;
    EXTIO_SCAN_REQ = (unsigned int)0x00000000;
    EXTIO_SCAN_STROKE = (unsigned int)0x00000001;

    EXTIO_SCAN_STROKE = (unsigned int)0x00000000;
}
