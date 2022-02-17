
extern void main(void);

void halt() {
  while (1) {
    __asm volatile("nop");
  }
}

void _entry() {
  // SCB->CCR &= ~(1 << 3);

  main();
  halt();
}

// Disable optimizations so that the startup code isn't optimized away.
__attribute__((optimize("O0"))) __attribute__((naked))
__attribute__((section(".start_section"))) void
startup(void) {
  __asm volatile(
      " LDR R0,=0x2001C000\n" /* set stack */
      " MOV SP,R0\n"
      //" BL _entry\n" /* call main */
      //"_exit: B .\n" /* never return */
  );
  _entry();
}
