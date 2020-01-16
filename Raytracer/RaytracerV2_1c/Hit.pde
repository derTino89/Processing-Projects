class Hit {

  Vektor _hitPoint;
  Vektor _surfaceNormVektor;
  boolean _hit;

  //Konstruktoren:

  Hit() {
    _hit=false;
  }
  
  Hit(Vektor hitpoint, Vektor norm, boolean hit) {
    _hitPoint=hitpoint.clone();
    _surfaceNormVektor = norm.clone();
    _hit=hit;
  }

  //Methoden:


  boolean isEmpty() {
    if (!_hit)
      return true;
    else return false;
  }

  //###########################AUSGABEN######################################

  Vektor getNormV() {
    return _surfaceNormVektor.clone();
  }
  Vektor getHitLoc() {
    return  _hitPoint.clone();
  }
}