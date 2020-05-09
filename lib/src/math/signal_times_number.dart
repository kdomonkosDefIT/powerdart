
/// Returns a signal where every element is multiplied by [number]
List<double> signalTimesNum(List<double> signal, num number) => signal.map((e) => e * number.toDouble());