
import 'dart:math' as math;

/// Returns a signal where every element is elevated to the power of [exponent]
/// [signal]: The signal to compute
/// [exponent]: exponent of the power
List<double> pow(List<double> signal, double exponent) =>
  signal.map((e) => math.pow(e, exponent).toDouble()).toList();