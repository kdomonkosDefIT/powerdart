
import 'dart:math' as math;

import 'package:complex/complex.dart';
import 'package:powerdart/src/dft.dart';
import 'package:powerdart/src/math/bit_reverse.dart';

///  Compute the one-dimensional discrete Fourier Transform.
///  [x]: A [List] of [Complex] values to compute
///
///  This class is inspired by the package scidart:
///  https://github.com/scidart/scidart/blob/master/lib/src/scidart/fftpack/fft/fft.dart
List<Complex> fft(List<Complex> x) {
  final n = x.length;
  List<Complex> res;
  if (x.isEmpty) {
    return [];
  } else if ((n & (n - 1)) == 0) {
    // It is power of 2
    res = _computeRadix2(x);
  } else {
    // It's not a power of 2
    // use the dft algorithm
    res = dft(x);
  }
  return res;
}

///  Computes the discrete Fourier transform (DFT) of the given complex vector.
///
///  The vector's length must be a power of 2.
///  Uses the Cooley-Tukey decimation-in-time radix-2 algorithm.
List<Complex> _computeRadix2(List<Complex> x) {
  List<Complex> buffer = List.from(x);
  int bits = math.log(buffer.length) ~/ math.log(2);
  for (int j = 1; j < buffer.length / 2; j++) {
    int swapPos = bitReverse(j, bits);
    Complex temp = buffer[j];
    buffer[j] = buffer[swapPos];
    buffer[swapPos] = temp;
  }

  for (int N = 2; N <= buffer.length; N <<= 1) {
    for (int i = 0; i < buffer.length; i += N) {
      for (int k = 0; k < N / 2; k++) {
        int evenIndex = i + k;
        int oddIndex = (i + k + (N / 2)).toInt();
        Complex even = buffer[evenIndex];
        Complex odd = buffer[oddIndex];

        double term = (-2 * math.pi * k) / N;
        Complex exp = Complex(math.cos(term), math.sin(term)) * odd;

        buffer[evenIndex] = even + exp;
        buffer[oddIndex] = even - exp;
      }
    }
  }

  return buffer;
}