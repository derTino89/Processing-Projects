class TTracer {
  FloatList tx;
  FloatList ty;
  float tposx;
  float tposy;
  float d;
  float _tracelenght;



  TTracer(float tracelenght, float radius) {    //Tracer mit abnehmendem Durchmesser
    _tracelenght = tracelenght;
    tx = new FloatList();
    ty = new FloatList();
    d = radius;
  }


  void move(float x, float y) {

    tx.append(x);
    ty.append(y);

    if (tx.size()>_tracelenght) {               //Listenlänge wird auf Tracerlänge begrenzt
      tx.remove(0);
    }  

    if (ty.size()>_tracelenght) {
      ty.remove(0);
    }
  }

  void render() {

    for (int i=tx.size()-2; i>=0; i--) {
      tposx = tx.get(i);
      tposy = ty.get(i);
      rect(tposx, tposy, i*d/_tracelenght, i*d/_tracelenght);
      //ellipse(tposx, tposy, i*d/_tracelenght, i*d/_tracelenght);
    }
  }
}