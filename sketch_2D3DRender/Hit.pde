class Hit {

  Vektor3D _hitPoint;
  Vektor3D _surfaceNormVektor;
  float _distance_on_ray;
  boolean _hit;

  //Konstruktoren:

  Hit() {
    _hit=false;
  }
  
  Hit(Vektor3D hitpoint, Vektor3D norm, boolean hit, float distance_on_ray) {
    _hitPoint=hitpoint.clone();
    _surfaceNormVektor = norm.clone();
    _hit=hit;
    _distance_on_ray=distance_on_ray;
  }

  //Methoden:


  boolean isEmpty() {
    if (!_hit || _distance_on_ray<0.1) // Hier war der Knackpunkt mit dem Kernschatten!!
      return true;
    else return false;
  }

  //###########################AUSGABEN######################################

  Vektor3D getNormV() {
    return _surfaceNormVektor.clone();
  }
  Vektor3D getHitLoc() {
    return  _hitPoint.clone();
  }
  float get_distance_on_ray(){
    return _distance_on_ray;
  }
}
