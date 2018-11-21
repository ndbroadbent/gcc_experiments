#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <time.h>

int main(int argc, const char* argv[]) {
  float startTime, endTime, timeElapsed;
  bool a, b;
  int i, counter;

  srand(time(NULL));

  // !a && b
  // ------------------------------------------
  startTime = (float)clock() / CLOCKS_PER_SEC;
  counter = 0;

  for (i = 0; i < 200000000; i++) {
    a = rand() & 1;
    b = rand() & 1;

    if (!a && b) {
      counter++;
    } else {
      counter--;
    }
  }

  endTime = (float)clock()/CLOCKS_PER_SEC;
  timeElapsed = endTime - startTime;

  printf("[%s] '!a && b' finished in: %f. (counter was: %d)\n",
    argv[0], timeElapsed, counter);


  // a < b
  // ------------------------------------------
  startTime = (float)clock() / CLOCKS_PER_SEC;
  counter = 0;

  for (i = 0; i < 200000000; i++) {
    a = rand() & 1;
    b = rand() & 1;

    if (a < b) {
      counter++;
    } else {
      counter--;
    }
  }

  endTime = (float)clock()/CLOCKS_PER_SEC;
  timeElapsed = endTime - startTime;

  printf("[%s] 'a < b' finished in: %f. (counter was: %d)\n",
    argv[0], timeElapsed, counter);
}
