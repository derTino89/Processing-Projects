class Shader { 
  Vektor _light;
  Vektor _hitPoint;
  Vektor _norm;
  Scene _scene;
 

  
  Shader(Scene scene) {
    _scene=scene;
    _light=scene.getLight();
  }

  color shade(Vektor currentNormV, Vektor hit) {
    _hitPoint=hit.clone();
    _norm=currentNormV.clone();
    _lampHit();
    if (!_lampHit()) {
      return color(0, 0, 200);
    }
    return color(_norm.skalar(_light));
  }
  

  boolean _lampHit() {
    Ray shadowRay=new Ray(_hitPoint, _light);
    Tracer shadowTrace = new Tracer(_scene);
    Hit shadowRayHit = shadowTrace.trace(shadowRay);

    if (!shadowRayHit.isEmpty()) {
      return false;
    } else return true;
  }
}
