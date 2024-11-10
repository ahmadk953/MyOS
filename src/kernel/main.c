#include <stdint.h>
#include <hal/hal.h>
#include <arch/i686/irq.h>

#include "stdio.h"
#include "memory.h"

extern uint8_t __bss_start;
extern uint8_t __end;

void crash_me();

void timer(Registers* regs)
{
    printf(".");
}

void __attribute__((section(".entry"))) start(uint16_t bootDrive)
{
    memset(&__bss_start, 0, (&__end) - (&__bss_start));

    HAL_Initialize();

    clrscr();

    printf("Hello world from kernel. This is a test message coming from the kernel.\n");
    printf("The current boot drive is: %d\n", bootDrive);

    // i686_IRQ_RegisterHandler(0, timer);
    // crash_me();

end:
    for (;;)
        ;
}
