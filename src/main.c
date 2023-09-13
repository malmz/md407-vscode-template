#include "add.h"

void main() {
  volatile int x = 0;
  int y = 0;
  x = add(1, 2);
  y = add(3, 4);
  while (1) {
    x = x + y;
    y = x * x;
  }
}
