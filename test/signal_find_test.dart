import 'package:test/test.dart';
import 'package:powerdart_v2/src/psd_analysis/signal_find.dart' as lib;

void main() {
  test("find", () {
    List<double> input = [1.0, 2.0, 3.0, 5.0, 6.0, 7.0];

    expect(lib.find(input, (element) => element == 2.0).toList(), [1]);
    expect(lib.find(input, (element) => element > 2.0).toList(), [2, 3, 4, 5]);
    expect(
        lib.find(input, (element) => element >= 2.0).toList(), [1, 2, 3, 4, 5]);
    expect(lib.find(input, (element) => element < 2.0).toList(), [0]);
    expect(lib.find(input, (element) => element <= 2.0).toList(), [0, 1]);
  });
}
