class Hit {
  Vektor _pointOnRay;      // Punkt P der zur Skalierung t gehörende Punkt auf dem Strahl mit dem kürzesten Abstand zum Kugelzentrum
  Vektor _centerOfSphere;
  Vektor _hitPoint;
  Ray _ray;
  float _sphereRadius;
  float _sqrSphereRadius;
  float _t;           //Die Stelle (Skaliereungsparameter) auf dem Ray, die am dichtesten zum Mittelpunkt der Kugel ist
  float _distance;    
  float _sqrDistance; 
  float _dt;          // Abstand auf dem Strahl von P zur Oberfläche der Kugel (auf dem Ray)

  Hit(VisualObject object) {
    if (object.type()=="sphere") {
      _centerOfSphere = object.getCenter();
      _sphereRadius = object.getRad();
      _sqrSphereRadius = _sphereRadius*_sphereRadius;
    }
  }

  boolean hits(Ray strahl) {
    _ray = strahl;
    _findPointOnRay();
    _distance = _centerOfSphere.minusV(_pointOnRay).lenght();
    //_distance = _centerOfSphere.dist(_pointOnRay);

    if (_distance<_sphereRadius)
      return true;
    else return false;
  }

  void _findHitPoint() {
    _sqrDistance = _centerOfSphere.sqrDist(_pointOnRay);
    _dt = sqrt(_sqrSphereRadius-_sqrDistance);
    _hitPoint = _ray.param(_t-_dt);
  }

  void _findPointOnRay() {
    _t = _ray.direction().skalar(_centerOfSphere.minusV(_ray.origin()));
    _pointOnRay = _ray.param(_t);
  }

  //#########################################################
  //    Berechnung Eintrittspunkt und seiner Flächennormale
  //#########################################################

  Vektor surfaceNormV() {
    _findHitPoint();
    Vektor faceDirection = new Vektor(_hitPoint.minusV(_centerOfSphere)); 
    Vektor normV = faceDirection.normV();
    return normV;
  }




  //###########################AUSGABEN#######################

  Vektor getHitLoc() {
    return  _hitPoint.clone();
  }
}
