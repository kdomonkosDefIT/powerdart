
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:powerdart/src/math/linspace.dart';
import 'package:powerdart/src/psd.dart';

void main() {
  final double fs = 100.0;
  List<double> x;

  setUp(() {
    List<double> t = linspace(0, 1, num: fs.toInt(), endpoint: false);
    x = t.map((e) => math.cos(2 * math.pi * 87 * e)).toList();
  });

  test("compute psd of a signal", () async{
    final psdRes = psd(x, fs);
    // Export the signal and the psd to files
    File signalFile = Directory.current.path.endsWith("/test")
      ? File("test_results/signal.txt")
      : File("test/test_results/signal.txt");
    File psdFile = Directory.current.path.endsWith("/test")
      ? File("test_results/psd.txt")
      : File("test/test_results/psd.txt");
    await signalFile.create(recursive: true);
    await psdFile.create(recursive: true);

    String signalString = '';
    for (var e in x) {
      signalString += "$e\n";
    }
    await signalFile.writeAsString(signalString);

    String psdString = '';
    for (var i = 0; i < psdRes.pxx.length; i++) {
      psdString += '${psdRes.pxx[i]}, ${psdRes.f[i]}\n';
    }
    await psdFile.writeAsString(psdString);
  });

  test("psd throws assertion", () {
    expect(() => psd([], 50), throwsAssertionError);

    expect(() => psd([1.0, 2.0, 3.0], -20), throwsAssertionError);
  });
}
