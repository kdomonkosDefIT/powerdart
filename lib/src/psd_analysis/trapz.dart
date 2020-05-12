/// Returns the approximate integral of [y] via the trapezoidal
/// method with respect to the coordinates or scalar spacing
/// specified by [x].
/// [y]: [List] of [double] to integrate
/// [x]: [List] of [double] representing the coordinates
///
/// The Trapezoidal method approximates the integration over
/// an interval.
/// integrate f(x) from a to b approx 1/2 sum (xn+1 - xn)(f(xn) + f(xn+1)
double trapz(List<double> y, List<double> x) {
  assert(x.isNotEmpty && y.isNotEmpty, "x and y must not be empty!");
  assert(x.length == y.length, "x and y must have same length!");

  // Get the slices
  final xSlice1 = x.getRange(0, x.length - 1);
  final xSlice2 = x.getRange(1, x.length);
  final ySlice1 = y.getRange(0, y.length - 1);
  final ySlice2 = y.getRange(1, y.length);

  // Return the sum
  return List.generate(
              y.length - 1,
              (idx) =>
                  (xSlice2.elementAt(idx) - xSlice1.elementAt(idx)) *
                  (ySlice1.elementAt(idx) + ySlice2.elementAt(idx)))
          .reduce((value, element) => value + element) /
      2.0;
}
