# powerdart

A Flutter package to compute the Power Spectral Density and analyze its result.

## Usage

To use this package add `powerdart` as a [dependency in your pubspec.yaml file.](https://flutter.dev/docs/development/packages-and-plugins/using-packages)

Import the library.

`import 'package:powerdart/powerdart.dart';`

Then create use the methods in the library.

```dart
void main() {
  final double fs = 100.0;
  List<double> x;

  // Generate a sinusoidal wave of 100 samples with frequency of 10Hz   
  List<double> t = linspace(0, 1, num: fs.toInt(), endpoint: false);
  x = t.map((e) => cos(2 * pi * 87 * e)).toList();
  
  // Compute his PSD
  final psdRes = psd(x, fs);
  
  // Find where the 70% of the power is
  final area = cumtrapz(psdRes["pxx"], psdRes["f"]);
  final powerDistribution = find(area, (e) => e >= 0.70 * area.last);
}
```
