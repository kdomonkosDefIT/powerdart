import 'package:test/test.dart';
import 'package:powerdart/src/math/signal_average.dart';

void main() {
  test("compute correct average", () {
    final val = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0];

    expect(average(val), equals(21 / 6));
  });

  test("average of empty list", () {
    List<int> val = [];
    expect(average(val), isNaN);
  });
}
