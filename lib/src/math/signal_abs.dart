
/// Returns a signal where every element is the absolute value
/// [signal]: The signal to compute
List<double> abs(List<double> signal) => signal.map((e) => e.abs()).toList();