/// This class hold the result of the maxIndexed
///
/// This class is used to simply and safely store the
/// results of maxIndexed.
/// [value]: the max value
/// [index]: index of the max value
class MaxIndexedResult {
  final double value;
  final int index;

  MaxIndexedResult(this.value, this.index);

  @override
  bool operator ==(other) =>
      other is MaxIndexedResult &&
      this.value == other.value &&
      this.index == other.index;

  @override
  int get hashCode => this.value.hashCode ^ this.index.hashCode;

  @override
  String toString() => "MaxIndexedResult(value=$value, index=$index)";
}
