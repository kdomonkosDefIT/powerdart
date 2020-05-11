
import 'dart:math' as math;

import 'package:complex/complex.dart';

///  Computes the discrete Fourier transform (DFT) of the given complex vector.
///  [x]: A [List] of [Complex] value to compute
///
///  This class is inspired by the package scidart:
///  https://github.com/scidart/scidart/blob/master/lib/src/scidart/fftpack/fft/fft.dart
List<Complex> dft(List<Complex> x) {
  int n = x.length;
  var out = List<Complex>(n);
  for (int k = 0; k < n; k++) {
    // For each output element
    double sumreal = 0;
    double sumimag = 0;
    for (int t = 0; t < n; t++) {
      // For each input element
      double angle = 2 * math.pi * t * k / n;
      sumreal += x[t].real * math.cos(angle) +
        x[t].imaginary * math.sin(angle);
      sumimag += -x[t].real * math.sin(angle) +
        x[t].imaginary * math.cos(angle);
    }
    out[k] = Complex(sumreal, sumimag);
  }

  return out;
}