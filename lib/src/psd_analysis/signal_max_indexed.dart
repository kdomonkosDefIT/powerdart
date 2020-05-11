
import 'dart:math';

/// Return the max value and his index of the [signal]
/// [signal]: [List] of [double] to find the max
/// 
/// This method will find the max value of the given [signal]
/// and return it and his index as a [List] with two elements, 
/// where the first is the maximum, and the second is the index.
List<double> maxIndexed(List<double> signal) {
  assert(signal.isNotEmpty, "The signal must not be empty");

  // If the signal has one element it's the max
  if (signal.length == 1)
    return [signal[0], 0.0];

  double maxValue = signal.reduce(max);
  int maxIdx = signal.indexOf(maxValue);

  return [maxValue, maxIdx.toDouble()];
}
