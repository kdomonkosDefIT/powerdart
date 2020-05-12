import 'package:complex/complex.dart';
import 'truncate.dart';

void complexListTruncate(List<Complex> a, int fractionDigits) {
  // Loop every item on the list and create a new Complex number
  // with truncated real and imaginary part.
  for (var i = 0; i < a.length; i++) {
    a[i] = Complex(truncate(a[i].real, fractionDigits),
        truncate(a[i].imaginary, fractionDigits));
  }
}
