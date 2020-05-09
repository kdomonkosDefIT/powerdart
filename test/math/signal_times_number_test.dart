
import 'package:flutter_test/flutter_test.dart';
import 'package:powerdart/src/math/signal_times_number.dart';

void main() {
  test("signal times a double", () {
    List<double> val = [1.0,2.0,3.0,4.0,5.0,6.0];
    double num = 2.0;
    List<double> expected = [2.0,4.0,6.0,8.0,10.0,12.0];

    expect(signalTimesNum(val, num), equals(expected));
  });

  test("signal times a null", () {
    List<double> val = [1.0,2.0,3.0,4.0,5.0,6.0];
    expect(() => signalTimesNum(val, null), throwsAssertionError);
  });

  test("empty signal times a double is empty", () {
    List<double> val = [];
    double num = 2.0;
    List<double> expected = [];

    expect(signalTimesNum(val, num), equals(expected));
  });
}