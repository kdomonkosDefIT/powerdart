/// Returns the cumulative approximate integral of [y] via the trapezoidal
/// method with respect to the coordinates or scalar spacing
/// specified by [x].
/// [y]: [List] of [double] to integrate
/// [x]: [List] of [double] representing the coordinates
List<double> cumtrapz(List<double> y, List<double> x) {
  assert(x.isNotEmpty && y.isNotEmpty, "x and y must not be empty!");
  assert(x.length == y.length, "x and y must have same length!");

  final xSlice1 = x.getRange(0, x.length - 1);
  final xSlice2 = x.getRange(1, x.length);
  final ySlice1 = y.getRange(0, y.length - 1);
  final ySlice2 = y.getRange(1, y.length);

  double sum = 0.0;
  final b = <double>[];
  for (var i = 0; i < y.length - 1; i++) {
    sum += (xSlice2.elementAt(i) - xSlice1.elementAt(i)) *
        ((ySlice1.elementAt(i) + ySlice2.elementAt(i)) / 2.0);
    b.add(sum);
  }
  return b;
}
