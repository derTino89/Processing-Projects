class VisualObject {

  //Kugelparameter
  Vektor _center;  
  float _rad; 
  String _type; 

  //Parameter für die Hitberechnung
  float _dt;
  float _t;
  float _distance;
  float _sqrSphereRadius;
  Vektor _pointOnRay;
  Vektor _hitPoint;
  Vektor _normV;
  Ray _ray;
  Hit _hit;

  //Konstruktor für Kugeln
  VisualObject(Vektor loc, float rad, String type) {
    _center=loc.clone();
    _rad=rad;
    _type=type;
  }

  boolean getHitByRay(Ray ray) {
    _ray=ray;
    _sqrSphereRadius = _rad*_rad;
    _findPointOnRay(); // P ausrechnen
    _distance = _center.minusV(_pointOnRay).lenght();
    _findHitPoint(); // Eintrittspunkt ausrechnen
    if (_distance<_rad) {
      surfaceNormV();
      _hit = new Hit(_hitPoint, _normV, true); 
      return true;
    } else return false;
  }


  void _findPointOnRay() {
    _t = _ray.direction().skalar(_center.minusV(_ray.origin()));
    _pointOnRay = _ray.param(_t);
  }

  Vektor surfaceNormV() {
    _findHitPoint();
    Vektor faceDirection = new Vektor(_hitPoint.minusV(_center)); 
    _normV = faceDirection.normV();
    return _normV.clone();
  }

  void _findHitPoint() {
    float sqrDistance = _distance*_distance;
    _dt = sqrt(_sqrSphereRadius-sqrDistance);
    _hitPoint = _ray.param(_t-_dt);
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
  Vektor getHitLoc() {
    return  _hitPoint.clone();
  }
  Hit getHit() {
    return _hit;
  }
}
