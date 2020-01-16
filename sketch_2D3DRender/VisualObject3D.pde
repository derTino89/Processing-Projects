class VisualObject3D extends Receiver {
  Vektor3D _center;
  float _step=20;
  boolean _filled=false;
  float _r =0;
  float _rad=40;

  VisualObject3D( Vektor3D loc) {
    _center=loc.clone();
  }

  void tic() {
    _r=_r+0.01;
  }

  void moveLeft() {
    _center=_center.addV(new Vektor3D(-_step, 0, 0));
    println(_center.getX());
  }

  void moveRight() {
    _center=_center.addV(new Vektor3D(_step, 0, 0));
    println(_center.getX());
  }

  void moveUp() {
    _center=_center.addV(new Vektor3D(0, -_step, 0));
    println(_center.getX());
  }

  void moveDown() {
    _center=_center.addV(new Vektor3D(0, _step, 0));
    println(_center.getX());
  }


  void enlarge() {
    _rad=_rad+5;
  }


  void render(PGraphics bitmap3D) {

    if (_filled) {
      bitmap3D.fill(250, 213, 0);
    } else bitmap3D.noFill();
    bitmap3D.pushMatrix();
    bitmap3D.translate(_center.getX(), _center.getY(), _center.getZ());
    bitmap3D.rotateY(_r);
    bitmap3D.stroke(255, 0, 0, 255);
    bitmap3D.sphereDetail(8);
    bitmap3D.sphere(_rad);
    bitmap3D.popMatrix();
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

  Vektor3D _PointOnRay(Ray ray) {
    return ray.param(_t(ray));
  }

  Vektor3D _surfaceNormV(Ray ray) {
    Vektor3D faceDirection = new Vektor3D(_HitPoint(ray).minusV(_center)); 
    return faceDirection.normV();
  }

  Vektor3D _HitPoint(Ray ray) {
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

  Vektor3D getCenter() {
    return _center.clone();
  }
}
