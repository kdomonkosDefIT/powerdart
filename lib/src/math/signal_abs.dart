import 'package:complex/complex.dart';

/// Returns a list of the magnitudes of the given [Complex] signal.
List<double> abs(List<Complex> signal) => signal.map((e) => e.abs()).toList();
