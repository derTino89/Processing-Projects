class VisualObject {
  Vektor _center;
  float _rad;
  String _type; 

//Konstruktor für Kugeln
  VisualObject(Vektor loc, float rad, String type) {
    _center=loc.clone();
    _rad=rad;
    _type=type;
  }







  //###########################AUSGABEN######################################

  String type() {
    return _type;
  }
  float getRad() {
    return _rad;
  }

  Vektor getCenter() {
    return _center.clone();
  }
}
