
import 'dart:math';

List<double> maxIndexed(List<double> signal) {
  assert(signal.isNotEmpty, "The signal must not be empty");

  // If the signal has one element it's the max
  if (signal.length == 1)
    return [signal[0], 0.0];

  double maxValue = signal.reduce(max);
  int maxIdx = signal.indexOf(maxValue);

  return [maxValue, maxIdx.toDouble()];
}