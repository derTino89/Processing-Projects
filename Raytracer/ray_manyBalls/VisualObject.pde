class VisualObject {
  Vektor _center;
  float _rad;
  float _t;
  float _dist;
  float _dt;

  Ray _strahl;
  Vektor _p;
  Vektor _N;
  Vektor _hit;

  VisualObject(Vektor loc, float rad) {
    _center=loc.clone();
    _rad=rad;
  }

  boolean hits(Ray strahl) {
    _strahl=strahl;
    // T ausrechnen:
    _t = _strahl.direction().skalar(_center.minusV(_strahl.origin()));

    // P ausrechnen
    _p=_strahl.param(_t);

    // Abstand
    _dist=_center.dist(_p);

    _dt = sqrt((_rad*_rad)-(_dist*_dist));


    if (_dist>=_rad)
      return false;
    else return true;
  } 
  Vektor surfaceNormV() {
    //eintrittspunkt
    Vektor _hit = _strahl.param(_t-_dt);
    //Berechnung des Flächen-Normalenvektors
    Vektor _faceDirection = new Vektor(_center.minusV(_hit)); 
    Vektor _normV = _faceDirection.normV();
    return _normV.clone();
  }

  void render() {
    translate(_center._x, _center._y, _center._z);
    sphere(_rad);
  }
}
