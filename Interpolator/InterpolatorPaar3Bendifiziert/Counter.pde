class Counter {
  int _counter;

  Counter() {
    _counter=0;
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