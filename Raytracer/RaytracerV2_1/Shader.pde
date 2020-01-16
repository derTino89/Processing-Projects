class Shader { 
  Vektor _light;
  Vektor _hitPoint;
  Vektor _norm;
  Scene _scene;
  boolean _hitSomething;
  color _testColor;
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
    _lighting();
    return color(_testColor);
  }
  
  void _lighting() {
    //_light=_light.clone().minusV(_hitPoint); // Punktlichtquelle, später schauen wie ich diese bereits in der Scene festlegen kann
    float sqrLightDistance = _light.lenght()*_light.lenght();
    float brightness = 300;
    float decrease = 255*brightness/sqrLightDistance;
    _testColor = color(_norm.skalar(_light)*decrease);
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
