class VisualObject {

  Vektor _center;  
  float _rad; 

  //Konstruktor für Kugeln
  VisualObject(Vektor loc, float rad) {
    _center=loc.clone();
    _rad=rad;
  }


  // jb20190404 umbenannt, siehe Passig, "Weniger schlecht programmieren"
  Hit calculateHit(Ray ray) {
    if (_distance(ray)<_rad) {
      return new Hit(_HitPoint(ray), _surfaceNormV(ray), true); 
    } else {
      return new Hit();
      
    }
  }

  float _distance(Ray ray) {
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
    float sqrDistance = _distance(ray)*_distance(ray);
    float dt = sqrt(_rad*_rad-sqrDistance);
    return ray.param(_t(ray)-dt);
  }





  //###########################AUSGABEN######################################


  float getRad() {
    return _rad;
  }

  Vektor getCenter() {
    return _center.clone();
  }

}
