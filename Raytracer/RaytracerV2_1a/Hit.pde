class Hit {

  Vektor _hitPoint;
  Vektor _surfaceNormVektor;
  boolean _hit;

  //Konstruktoren:

  Hit() {
  }
  Hit(Vektor hitpoint, Vektor norm, boolean hit) {
    _hitPoint=hitpoint.clone();
    _surfaceNormVektor = norm.clone();
    _hit=hit;
  }

  //Methoden:

  void setHitPoint(Vektor Hitpoint) {
    _hitPoint = Hitpoint.clone();
  }
  void setNormVektor(Vektor norm) {
    _surfaceNormVektor = norm.clone();
  }
  void setHit(boolean hit) {
    _hit=hit;
  }

  boolean isEmpty() {
    if (!_hit)
      return true;
    else return false;
  }

  //###########################AUSGABEN######################################

  Vektor surfaceNormV() {
    return _surfaceNormVektor.clone();
  }
  Vektor getHitLoc() {
    return  _hitPoint.clone();
  }
}
