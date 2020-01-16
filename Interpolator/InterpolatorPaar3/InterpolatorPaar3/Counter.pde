class Counter {
  int _counter;

  Counter(int counter) {
    _counter=counter;
  }

  void countForward() {
    _counter++;
  }
  void countBackward() {
    _counter--;
  }
  void setCounter(int newCounter){
    _counter=newCounter;
  }

  int currentCounter() {
    return _counter;
  }
}