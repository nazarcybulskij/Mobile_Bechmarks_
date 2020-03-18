using System;

namespace demo3
{
    public class Calculator
    {
        public Calculator(){}

        public double gaussLegendre(int iterations)
        {
            double a = 1.0;
            double b = 1.0 / Math.Sqrt(2);
            double t = 1.0 / 4.0;
            double p = 1.0;

            for (int i = 0; i < iterations; i++)
            {
                double aNext = (a + b) / 2;
                double bNext = Math.Sqrt(a * b);
                double tNext = t - p * Math.Pow(a - aNext, 2.0);
                double pNext = 2 * p;
                a = aNext;
                b = bNext;
                t = tNext;
                p = pNext;
            }
            return Math.Pow(a + b, 2) / (4 * t);
        }

        public double borwein(int k)
        {
            double ak = 6.0 - 4 * Math.Sqrt(2);
            double yk = Math.Sqrt(2) - 1.0;
            double ak1;
            double yk1;
            for (int i = 0; i < k; i++)
            {
                yk1 = (1 - Math.Pow((1 - yk * yk * yk * yk), (0.25))) / (1 + Math.Pow((1 - yk * yk * yk * yk), (0.25)));
                //ak1 = ak * math.pow((1 + yk1), 4) - math.pow(2, 2 * i + 3) * yk1 * (1 + yk1 + yk1 * yk1);
                ak1 = ak * Math.Pow((1 + yk1), 4.0) - Math.Pow(2.0, (2 * i + 3.0)) * yk1 * (1 + yk1 + yk1 * yk1);
                yk = yk1;
                ak = ak1;
            }
            return ak;
        }
    }
}

