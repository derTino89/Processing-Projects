class Hit {

  Vektor _hitPoint;
  Vektor _surfaceNormVektor;
  float _distance_on_ray;
  boolean _hit;

  //Konstruktoren:

  Hit() {
    _hit=false; // das ist clever jb20190417
  }
  
  Hit(Vektor hitpoint, Vektor norm, boolean hit, float distance_on_ray) {
    if (!hit)
      println("Hit: konstruktor(): User tappt in Falle, die der Entwickler böswillig aufgestellt hat!");
    _hitPoint=hitpoint.clone();
    _surfaceNormVektor = norm.clone();
    _hit=hit;    // das ist NICHT clever jb20190417
    _distance_on_ray=distance_on_ray;
  }

  //Methoden:


  boolean isEmpty() {
    if (!_hit || _distance_on_ray<0.1) // Hier war der Knackpunkt mit dem Kernschatten!!
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
  float get_distance_on_ray(){
    return _distance_on_ray;
  }
}
