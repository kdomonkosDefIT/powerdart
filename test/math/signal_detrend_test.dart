import 'package:test/test.dart';
import 'package:powerdart/src/math/signal_detrend.dart';

void main() {
  test("detrend a singal", () {
    List<double> val = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
    List<double> expected = [-2.5, -1.5, -0.5, 0.5, 1.5, 2.5];

    expect(detrend(val), equals(expected));
  });

  test("detrend an empty singal", () {
    expect(detrend([]), isEmpty);
  });
}
