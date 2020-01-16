class Interpol {
  Vektor2D _punkt1;
  Vektor2D _punkt2;
  MovableVektor2D _punkta;
  MovableVektor2D _punktb;
  Vektor2D _runner;        // Interpolierter Vektor
  float _t = 0;            // Laufvariable
  float _tickrate = 0.01;  // Geschwindigkeit des interpolierens
  boolean _hit;            // Grenze der Laufvariable


  Interpol(Vektor2D in1, Vektor2D in2) {
    _punkt1=in1.clone();
    _punkt2=in2.clone();
  }

  Interpol(MovableVektor2D in1, MovableVektor2D in2) {
    _punkt1 = new Vektor2D(in1.x(), in1.y());
    _punkt2 = new Vektor2D(in2.x(), in2.y());
  }

  void ticloop() {
    _punkta=new MovableVektor2D(_punkt1);
    _punktb=new MovableVektor2D(_punkt2);

    _punkta.tic();
    _punktb.tic();
    _punkt1.setX(_punkta.x());
    _punkt1.setY(_punkta.y());
    _punkt2.setX(_punktb.x());
    _punkt2.setY(_punktb.y());
    

    if (_t<1 && _hit==false) {      
      _runner=new Vektor2D(_punkt1.malZahl(_t).plus(_punkt2.malZahl(1-_t)));
      _t=_t+_tickrate;
    } else if (_t>0 && _hit ==true) {
      _runner=new Vektor2D(_punkt1.malZahl(_t).plus(_punkt2.malZahl(1-_t)));
      _t=_t-_tickrate;
    }

    if (_t>=1) {
      _hit=true;
    }
    if (_t<=0) {
      _hit=false;
    }
  }

  void tic() {

    if (_t<1) {      
      _runner=new Vektor2D(_punkt1.malZahl(_t).plus(_punkt2.malZahl(1-_t)));
      _t=_t+_tickrate;
    }
  }

  void render() {
    ellipse(_runner.getX(), _runner.getY(), 5, 5);
  }
}