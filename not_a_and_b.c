#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

int main(int argc, const char* argv[]) {
  if(argc != 3) {
    printf("Usage: %s <a> <b>\n", argv[0]);
    exit(1);
  }
  bool a = strtol(argv[1], NULL, 10) != 0;
  bool b = strtol(argv[2], NULL, 10) != 0;

  if (!a && b) {
    printf("!a && b == true (a: %d, b: %d)\n", a, b);
  } else {
    printf("!a && b == false (a: %d, b: %d)\n", a, b);
  }
}
