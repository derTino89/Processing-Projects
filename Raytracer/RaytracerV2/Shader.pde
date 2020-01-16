class Shader { 
  Vektor _light;
  Vektor _hitPoint;
  Vektor _norm;
  Scene _scene;
  boolean _hitSomething;
  color _testColor;
  Shader(Scene scene) {
    _scene=scene;
  }

  color shade(Vektor light, Vektor currentNormV, Vektor hit) {
    _hitPoint=hit.clone();
    _norm=currentNormV.clone();
    _light=light.clone().minusV(_hitPoint); // Punktlichtquelle, später schauen wie ich diese bereits in der Scene festlegen kann
    _lampHit();
    if (_hitSomething) {
      return color(0, 0, 200);
    }
    _lighting();
    return color(_testColor);
  }
  
  void _lighting() {
    float sqrLightDistance = _light.lenght()*_light.lenght();
    float brightness = 300;
    float decrease = 255*brightness/sqrLightDistance;
    _testColor = color(_norm.skalar(_light)*decrease);
  }

  void _lampHit() {
    Ray shadowRay=new Ray(_hitPoint, _light);
    Tracer shadowTrace = new Tracer();
    shadowTrace.lookForHitArray(shadowRay, _scene);
    //println(shadowTrace.hit());
    //println("Länge vom ShadowRay:", shadowTrace.hitPointLoc().minusV(shadowRay.origin()).lenght());
    //_testColor=color(shadowTrace.hitPointLoc().minusV(shadowRay.origin()).lenght());
    if (shadowTrace.hit()) {
      _hitSomething=true;
    } else _hitSomething=false;
  }
}
