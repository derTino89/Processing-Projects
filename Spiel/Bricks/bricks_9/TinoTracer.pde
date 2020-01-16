class TTracer {
  FloatList _tx;
  FloatList _ty;
  float _tposx;
  float _tposy;
  float _d;
  float _tracelenght;



  TTracer(float tracelenght, float radius) {    //Tracer mit abnehmendem Durchmesser
    _tracelenght = tracelenght;
    _tx = new FloatList();
    _ty = new FloatList();
    _d = radius;
  }


  void move(float x, float y) {

    _tx.append(x);
    _ty.append(y);

    if (_tx.size()>_tracelenght) {               //Listenlänge wird auf Tracerlänge begrenzt
      _tx.remove(0);
      _ty.remove(0);
    }  
  }

  void render() {

    for (int i=_tx.size()-2; i>=0; i--) {
      _tposx = _tx.get(i);
      _tposy = _ty.get(i);
      rect(_tposx, _tposy, i*_d/_tracelenght, i*_d/_tracelenght);
      //ellipse(tposx, tposy, i*d/_tracelenght, i*d/_tracelenght);
    }
  }
}