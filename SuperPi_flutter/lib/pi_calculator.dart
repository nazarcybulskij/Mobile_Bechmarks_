import 'dart:math' as math;


class PiCalculator {

  double gaussLegendre(int iterations) {
    double a = 1.0;
    double b = 1.0 / math.sqrt(2);
    double t = 1.0 / 4.0;
    double p = 1.0;

    for (int i = 0; i < iterations; i++) {
      double aNext = (a + b) / 2;
      double bNext = math.sqrt(a * b);
      double tNext = t - p * math.pow(a - aNext, 2.0);
      double pNext = 2 * p;
      a = aNext;
      b = bNext;
      t = tNext;
      p = pNext;
    }
    return math.pow(a + b, 2) / (4 * t);
  }

  double borwein(int k) {
    double ak = 6.0 - 4 * math.sqrt(2);
    double yk = math.sqrt(2) - 1.0;
    double ak1 ;
    double yk1 ;
    for (int i = 0; i < k; i++) {
      yk1 = (1 - math.pow((1 - yk * yk * yk * yk),(0.25)))/(1 + math.pow((1 - yk * yk * yk * yk),(0.25)));
      //ak1 = ak * math.pow((1 + yk1), 4) - math.pow(2, 2 * i + 3) * yk1 * (1 + yk1 + yk1 * yk1);
      ak1 = ak * math.pow((1 + yk1), 4.0) - math.pow(2.0, (2 * i + 3.0)) * yk1 * (1 + yk1 + yk1 * yk1);
      yk = yk1;
      ak = ak1;
    }
    return ak;
  }


//  var rand = math.Random(100);
//
//  double mathPow(int iterations) {
//    for (int i = 0; i < iterations; i++) {
//      math.pow(i, 2);
//    }
//    return rand.nextDouble();
//  }




}