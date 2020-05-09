
import 'package:powerdart/src/math/average.dart';

/// Detrend the given signal.
/// [signal]: A [List] of [num] to detrend.
List<double> detrend(List<num> signal) {
  final double mean = average(signal);
  return signal.map((e) => e.toDouble() - mean);
}