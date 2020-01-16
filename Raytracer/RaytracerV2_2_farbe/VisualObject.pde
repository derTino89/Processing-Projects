class VisualObject {

  Vektor _center;  
  float _rad; 

  //Konstruktor für Kugeln
  VisualObject(Vektor loc, float rad) {
    _center=loc.clone();
    _rad=rad;
  }


  Hit calculateHit(Ray ray) {
    if (_distance_of_P(ray)<_rad) {
      return new Hit(_HitPoint(ray), _surfaceNormV(ray), true, get_t_of_hitpoint(ray));
    } else {
      return new Hit();
    }
  }

  float _distance_of_P(Ray ray) {
    return _center.minusV(_PointOnRay(ray)).lenght();
  }

  float _t(Ray ray) {
    return ray.direction().skalar(_center.minusV(ray.origin()));
  }

  Vektor _PointOnRay(Ray ray) {
    return ray.param(_t(ray));
  }

  Vektor _surfaceNormV(Ray ray) {
    Vektor faceDirection = new Vektor(_HitPoint(ray).minusV(_center)); 
    return faceDirection.normV();
  }

  Vektor _HitPoint(Ray ray) {
    return ray.param(get_t_of_hitpoint(ray));
  }

  float get_t_of_hitpoint(Ray ray) {
    float sqrDistance_of_P = _distance_of_P(ray)*_distance_of_P(ray);
    float dt = sqrt(_rad*_rad-sqrDistance_of_P);
    return _t(ray)-dt;
  }





  //###########################AUSGABEN######################################


  float getRad() {
    return _rad;
  }

  Vektor getCenter() {
    return _center.clone();
  }
}
