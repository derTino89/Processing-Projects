class Shader { 

  Scene _scene;
   
  Shader(Scene scene) {
    _scene=scene;
  }

  color shade(Vektor currentNormV, Vektor hit) {
    
    Light lightOne=_scene.getLight();
    Vektor lampOne=lightOne.lampDirection(hit);
    
    
    if (!_lampHit(hit,lampOne)) {
      return color(0, 0, 0);
    }
    float valueR = currentNormV.skalar(lampOne)*lightOne.calculateR(hit);
    float valueG = currentNormV.skalar(lampOne)*lightOne.calculateG(hit);
    float valueB = currentNormV.skalar(lampOne)*lightOne.calculateB(hit);
    return color(valueR,valueG,valueB);
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
