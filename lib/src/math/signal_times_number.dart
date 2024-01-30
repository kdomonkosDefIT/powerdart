/// Returns a signal where every element is multiplied by [number]
List<double> signalTimesNum(List<double> signal, double number) {
  return signal.map((e) => e * number.toDouble()).toList();
}
