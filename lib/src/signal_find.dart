
Iterable<int> find(List<double> data, bool test(double element)) sync*{
  for(int i = 0; i < data.length; i++) {
    if (test(data[i]))
      yield i;
  }
}