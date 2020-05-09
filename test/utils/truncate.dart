
import 'dart:math' as math;

double truncate(double val, int fractionDigits) {
  double mod = math.pow(10.0, fractionDigits);
  return ((val * mod).round().toDouble() / mod);
}
