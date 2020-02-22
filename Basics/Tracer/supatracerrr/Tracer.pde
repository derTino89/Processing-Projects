class Tracer {
  FloatList tx;
  FloatList ty;
  float tposx;
  float tposy;
  float d;
  float _tracelenght;



  Tracer(float tracelenght, float radius) {
    _tracelenght = tracelenght;
    tx = new FloatList();
    ty = new FloatList();
    d = radius;
  }


  void trace(float x, float y) {

    tx.append(x);
    ty.append(y);

    if (tx.size()>_tracelenght) {
      tx.remove(0);
    }  

    if (ty.size()>_tracelenght) {
      ty.remove(0);
    }
  }

  void render() {

    for (int i=tx.size()-1; i>=0; i--) {
      tposx = tx.get(i);
      tposy = ty.get(i);
      ellipse(tposx, tposy, i*d/_tracelenght, i*d/_tracelenght);
    }


    //for (int i=1;i<tx.size();i++){
    //    if(i<_tracelenght){
    //      tposx = tx.get(i);
    //      tposy = ty.get(i);
    //      ellipse(tposx,tposy,d-(i*d/_tracelenght),d-(i*d/_tracelenght));
    //    }  
    //}
  }
}