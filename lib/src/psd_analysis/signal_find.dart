
/// Returns a list of index that pass the [test].
/// [data]: [List] of [double]
/// [test]: method to thest against the data
/// 
/// This methdo will loop through every element in the [data]
/// and return the index of all the items that pass the [test].
Iterable<int> find(List<double> data, bool test(double element)) sync*{
  for(int i = 0; i < data.length; i++) {
    if (test(data[i]))
      yield i;
  }
}
