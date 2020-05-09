
import 'package:complex/complex.dart';
import 'package:powerdart/src/fft.dart';

///  Compute the one-dimensional discrete Fourier Transform for a Real input.
///  [x]: A [List] of [double] value to compute
///
///  This class is inspired by the package scidart:
///  https://github.com/scidart/scidart/blob/master/lib/src/scidart/fftpack/rfft/rfft.dart
List<Complex> rfft(List<double> x) {
  var buffer = x.map((e) => Complex(e)).toList();
  var cfft = fft(buffer);
  return cfft.getRange(0, (cfft.length / 2).floor() + 1).toList();
}