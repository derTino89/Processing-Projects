

class InterpolationCalculator {
  Vektor2D _punkt1;
  Vektor2D _punkt2;
  Vektor2D _runner;        // Interpolierter Vektor
  float _t = 0;            // Laufvariable
  float _tickrate = 0.01;  
  boolean _hit;            // Grenze der Laufvariable


  //InterpolationCalculator(Vektor2D in1, Vektor2D in2) {
  //  _punkt1=in1.clone();
  //  _punkt2=in2.clone();
  //}


  void addPoint1(Vektor2D punkt1) {
    _punkt1=punkt1.clone();
  }

  void addPoint2(Vektor2D punkt2) {
    _punkt2=punkt2.clone();
  }


  void ticloop() {
    if (_t>=1) {
      _hit=true;
    }
    if (_t<=0) {
      _hit=false;
    }
    if (_t<1 && _hit==false) {      
      _runner=new Vektor2D(_punkt1.malZahl(_t).plus(_punkt2.malZahl(1-_t)));
      _t=_t+_tickrate;
    } else if (_t>0 && _hit ==true) {
      _runner=new Vektor2D(_punkt1.malZahl(_t).plus(_punkt2.malZahl(1-_t)));
      _t=_t-_tickrate;
    }
  }

  void renderRunner() {
    ellipse(_runner.getX(), _runner.getY(), 10, 10);
  }
  void renderPoint1() {
    ellipse(_punkt1.getX(), _punkt1.getY(), 30, 30);
  }
  void renderPoint2() {
    ellipse(_punkt2.getX(), _punkt2.getY(), 30, 30);
  }

  boolean hasTwoPoints() {
    if (_punkt1==null) {
      return false;
    }
    if (_punkt2==null) {
      return false;
    }
    return true;
  }

  boolean hasPoint1() {
    if (_punkt1!=null) {
      return true;
    }
    return false;
  }
}


//hier nicht benötigt:
//void tic() {
//  if (_t<1) {      
//    _runner=new Vektor2D(_punkt1.malZahl(_t).plus(_punkt2.malZahl(1-_t)));
//    _t=_t+_tickrate;
//  }
//}