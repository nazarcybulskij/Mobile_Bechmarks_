#include <stdint.h>
#include <math.h>

extern "C" __attribute__((visibility("default"))) __attribute__((used))
int32_t native_add(int32_t x, int32_t y) {
    return x + y;
}


extern "C" __attribute__((visibility("default"))) __attribute__((used))
double gaussLegendre(int32_t iterations) {
    double a = 1.0;
    double b = 1.0 / sqrt(2);
    double t = 1.0 / 4.0;
    double p = 1.0;

    for (int i = 0; i < iterations; i++) {
      double aNext = (a + b) / 2;
      double bNext = sqrt(a * b);
      double tNext = t - p * pow(a - aNext, 2);
      double pNext = 2 * p;
      a = aNext;
      b = bNext;
      t = tNext;
      p = pNext;
    }
    return pow(a + b, 2) / (4 * t);
}

extern "C" __attribute__((visibility("default"))) __attribute__((used))
double getOneByPi(int32_t k) {
    double ak = 6.0 - 4 * sqrt(2);
    double yk = sqrt(2) - 1.0;
    double ak1 ;
    double yk1 ;
    for (int i = 0; i < k; i++) {
      yk1 = (1 - pow((1 - yk * yk * yk * yk),(0.25)))/(1 + pow((1 - yk * yk * yk * yk),(0.25)));
      ak1 = ak * pow((1 + yk1), 4) - pow(2, 2 * i + 3) * yk1 * (1 + yk1 + yk1 * yk1);
      yk = yk1;
      ak = ak1;
    }
    return ak;
 }