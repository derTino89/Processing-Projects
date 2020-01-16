class Shader { 

  Scene _scene;
   
  Shader(Scene scene) {
    _scene=scene;
  }

  color shade(Vektor3D currentNormV, Vektor3D hit) {
    
    Light lightOne=_scene.getLight(0);
    Vektor3D lampOne=lightOne.lampDirection(hit);
    println("shade");
    
    if (!_lampHit(hit,lampOne)) {
      return color(0, 0, 0);
    }
    float valueR = currentNormV.skalar(lampOne)*lightOne.calculateR(hit);
    float valueG = currentNormV.skalar(lampOne)*lightOne.calculateG(hit);
    float valueB = currentNormV.skalar(lampOne)*lightOne.calculateB(hit);
    return color(valueR,valueG,valueB);
  }
  

  boolean _lampHit(Vektor3D shadowRayOrigin, Vektor3D light) {
    Ray shadowRay=new Ray(shadowRayOrigin, light);
    Tracer shadowTrace = new Tracer(_scene);
    Hit shadowRayHit = shadowTrace.trace(shadowRay);

    if (!shadowRayHit.isEmpty()) {
      return false;
    } else return true;
  }
}
