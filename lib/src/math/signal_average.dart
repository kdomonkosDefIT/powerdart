
/// Returns the average of the given signal
/// [signal]: A [List] of [num] to mean.
///
/// If the signal is empty will return [double.nan].
double average(List<num> signal) {
  if (signal.isEmpty)
    return double.nan;
  return signal.fold(0.0, (prev, e) => prev + e.toDouble()) / signal.length;
}