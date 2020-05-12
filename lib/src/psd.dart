
import 'package:powerdart/src/math/linspace.dart';
import 'package:powerdart/src/math/signal_abs.dart';
import 'package:powerdart/src/math/signal_detrend.dart';
import 'package:powerdart/src/math/signal_pow.dart';
import 'package:powerdart/src/math/signal_times_number.dart';
import 'package:powerdart/src/dft/real_fft.dart';

/// Compute the Power Spectral Density
///
/// This method computes the power spectral density
/// and the vector of normalized frequencies of the
/// given real signal like matlab.
/// Uses this simple algorithm:
/// ```
///   N = length(x);
///   xdft = fft(detrend(x));
///   xdft = xdft(1:N/2+1);
///   psdx = (1/(Fs*N)) * abs(xdft).^2;
///   psdx(2:end-1) = 2*psdx(2:end-1);
///   freq = 0:(Fs)/length(x):Fs/2;
/// ```
/// [data]: [List] of [double] with the signal to compute
/// [fs]: sample rate of the signal
PsdResult psd(List<double> data, double fs) {
  assert(data.isNotEmpty, "Input data must not be empty");
  assert(fs > 0, "Fs must be greather than 0");

  final n = data.length;
  // Compute the DFT of the real signal
  var dft = rfft(detrend(data));

  // Compute the power spectral from the DFT
  var psd = signalTimesNum(pow(abs(dft), 2), (1 / (fs * n)));
  // Double the value of each elements except the first and the last
  for (var i = 1; i < psd.length - 1; i++) {
    psd[i] = 2 * psd[i];
  }

  // Compute the normalized frequency vector
  final freq = linspace(0, (fs / 2) + 1, num: (fs/2).floor() + 1);
  //print(freq);

  return PsdResult(psd,freq);
}