// jb 20180524 Die Klasse ist ein bischen unscharf benannt. Diese Unschärfe führt bei Ihren Entwürfen dann
// zu weiteren Unschärfen. Ich habe es mal versucht zu schärfen

class InterpolationCalculator {
  Vektor2D _punkt1;
  Vektor2D _punkt2;
  Vektor2D _runner;        // Interpolierter Vektor
  float _t = 0;            // Laufvariable
  float _tickrate = 0.01;  // Geschwindigkeit des interpolierens
  boolean _hit;            // Grenze der Laufvariable


  InterpolationCalculator(Vektor2D in1, Vektor2D in2) {
    _punkt1=in1.clone();
    _punkt2=in2.clone();
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

  void render() {
    ellipse(_runner.getX(), _runner.getY(), 5, 5);
  }
}


//hier nicht benötigt:
//void tic() {
//  if (_t<1) {      
//    _runner=new Vektor2D(_punkt1.malZahl(_t).plus(_punkt2.malZahl(1-_t)));
//    _t=_t+_tickrate;
//  }
//}