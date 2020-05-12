///  Return evenly spaced numbers over a specified interval.
///
///  Returns `num` evenly spaced samples, calculated over the
///  interval [`start`, `stop`].
///  [start] : double
///  The starting value of the sequence.
///  [stop] : double
///  The end value of the sequence, unless `endpoint` is set to False.
///  In that case, the sequence consists of all but the last of ``num + 1``
///  evenly spaced samples, so that `stop` is excluded.  Note that the step
///  size changes when `endpoint` is false.
///  [num] : int, optional, defaults to 100 like the matlab implementation
///  Number of samples to generate. Default is 50. Must be non-negative.
///  [endpoint] : bool, optional
///  If true, `stop` is the last sample. Otherwise, it is not included.
///
/// This class is inspired by the package scidart
/// https://github.com/scidart/scidart/blob/master/lib/src/numdart/spaces/linspace.dart
List<double> linspace(double start, double stop,
    {int num = 100, bool endpoint = true}) {
  assert(num >= 0, "num need be >= than 0");

  double delta = endpoint ? (stop - start) / (num - 1) : (stop - start) / num;
  return List<double>.generate(num, (i) => start + delta * i);
}
