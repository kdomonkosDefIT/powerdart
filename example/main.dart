import 'dart:math';

import 'package:powerdart/powerdart.dart';

void main() {
  final double fs = 100.0;
  List<double> x;

  // Generate a sinusoidal wave of 100 samples with frequency of 10Hz
  List<double> t = linspace(0, 1, num: fs.toInt(), endpoint: false);
  x = t.map((e) => cos(2 * pi * 87 * e)).toList();

  // Compute his PSD
  final psdRes = psd(x, fs);

  // Find where the 70% of the power is
  final area = cumtrapz(psdRes.pxx, psdRes.f);
  final powerDistribution = find(area, (e) => e >= 0.70 * area.last);
}
