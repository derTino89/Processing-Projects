class Shader { 

  Scene _scene;

  Shader(Scene scene) {
    _scene=scene;
  }

  color shade(Vektor currentNormV, Vektor hit) {
    Color finalColor = new Color(0, 0, 0);

    for (int i=0; i<_scene.getLights().size(); i++) {
      Vektor lamp=_scene.getLights().get(i).lampDirection(hit);
      Light light = _scene.getLights().get(i);
      
      if (!_lampHit(hit, lamp)) {
        return color(0, 0, 0);
      }
      float valueR = currentNormV.skalar(lamp)*light.calculateR(hit);
      float valueG = currentNormV.skalar(lamp)*light.calculateG(hit);
      float valueB = currentNormV.skalar(lamp)*light.calculateB(hit);
      finalColor = finalColor.plus(valueR, valueG, valueB);
    }
    return finalColor.paint();
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