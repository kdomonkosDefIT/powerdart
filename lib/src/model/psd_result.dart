/// This class hold the result of the PSD computation
///
/// This class is used to simply and safely store the
/// results of the PSD analysis.
/// [pxx]: the psd values
/// [f]: the normalized frequency vector
class PsdResult {
  final List<double> pxx;
  final List<double> f;

  const PsdResult(this.pxx, this.f);

  @override
  String toString() => "PsdResult(pxx=$pxx, f=$f)";

  @override
  int get hashCode => pxx.hashCode ^ f.hashCode;

  @override
  bool operator ==(other) =>
      other is PsdResult && this.pxx == other.pxx && this.f == other.f;
}
