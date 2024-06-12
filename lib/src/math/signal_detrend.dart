import 'package:powerdart_v2/src/math/signal_average.dart';

/// Detrend the given signal.
/// [signal]: A [List] of [num] to detrend.
List<double> detrend(List<num> signal) {
  final double mean = average(signal);
  if (mean.isNaN) return [];
  return signal.map((e) => e.toDouble() - mean).toList();
}
