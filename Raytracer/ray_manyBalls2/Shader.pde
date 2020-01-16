class Shader { 
  Vektor _licht;
  Vektor _hit;
  Vektor _norm;
  ArrayList<VisualObject> _Balls; 
  Ray shadowRay;

  Shader(ArrayList<VisualObject> balls) {
    _Balls=balls;
  }

  color shade(Vektor licht, Vektor currentNormV, Vektor hit) {
    _licht=licht;
    _hit=hit;
    _norm=currentNormV;
    shadowRay=new Ray(_hit, _licht);
    if (_lampHit()) {
      //println("ding");
      return color(_norm.skalar(_licht));
    } else return color(0, 0, 0);
  }

  boolean _lampHit() {
    println(_Balls);
    for (int i=0; i<_Balls.size(); i++) {
      if (_Balls.get(i).hits(shadowRay)) {
        //println("dong");
        return false;
      }
    }
    return true;
  }
}