class Shader { 

  Scene _scene;

  Shader(Scene scene) {
    _scene=scene;
  }

  color shade(Vektor currentNormV, Vektor hit) {
    Color finalColor = new Color(0, 0, 0);

    for (int i=0; i<_scene.getLights().size(); i++) {
      Vektor lamp=_scene.getLights().get(i).lightVektor(hit); // jb 20190517 hier wird die Helligkeit falsch berechnet

      if (!_lampHit(hit, lamp)) {
        return color(150, 0, 0);
      }
      float valueR = currentNormV.skalar(lamp); // OK
      float valueG = currentNormV.skalar(lamp); // Doppelt so teuer
      float valueB = currentNormV.skalar(lamp); // Dreimal so teuer - Urlaubsreise gestrichen wegen zuviel C02

      finalColor = finalColor.plus(valueR, valueG, valueB);
    }
    return finalColor.asProcessingColor();
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
