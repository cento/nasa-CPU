#include <stdio.h>
#include "fde_ip.h"

unsigned int code_ram[CODE_RAM_SIZE]={
		0x00d00513,
		0x00c00713,
		0x00700593,
		0x01c00293,
		0xff600f93,
		0x7e600913,
		0x00058633,
		0x00a676b3,
		0x00e6e7b3,
		0x0057c833,
		0x40b80833,
		0x00a838b3,
		0x00581333,
		0x01f323b3,
		0x01233e33,
		0x00535eb3,
		0x40535f33,
		0x00008067,
};

int main(){
  unsigned int nbi;
  fde_ip(0, code_ram, &nbi);
  printf("%d fetched, decoded and executed instructions\n",
          nbi);
  return 0;
}
