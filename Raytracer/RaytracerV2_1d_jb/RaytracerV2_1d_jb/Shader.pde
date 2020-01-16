class Shader { 

  Scene _scene;
   
  Shader(Scene scene) {
    _scene=scene;
  }

  color shade(Vektor currentNormV, Vektor hit) {
    Vektor light=_scene.getLight();
    Vektor shadowRayOrigin=hit;
    Vektor norm=currentNormV;
    if (!_lampHit(shadowRayOrigin,light)) {
      return color(0, 0, 200);
    }
    return color(norm.skalar(light));
  }
  

  boolean _lampHit(Vektor shadowRayOrigin, Vektor light) {
    Ray shadowRay=new Ray(shadowRayOrigin, light);
    Tracer shadowTrace = new Tracer(_scene);
    Hit shadowRayHit = shadowTrace.trace(shadowRay);

    if (!shadowRayHit.isEmpty()) {
      return false;
    } else return true;
  }
}
