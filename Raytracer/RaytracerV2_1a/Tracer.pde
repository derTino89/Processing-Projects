class Tracer {
  ArrayList<VisualObject> _objects;
  ArrayList<Hit> _hits;
  Scene _scene;
  Hit _theOne;
  Vektor _surfaceNormV;
  Ray _ray;

  Tracer(Scene scene) {
    _scene = scene;
    _objects=_scene.getBalls();
    _hits = new ArrayList<Hit>();
  }


  Hit trace(Ray ray) {
    _ray=ray;
    _theOne=new Hit();
    for (int i=0; i<_objects.size(); i++) {
      if (!_objects.get(i).getHitByRay(_ray)) {
        _theOne.setHit(false);
      } else {
        _hits.add(_objects.get(i).getHit());
        _theOne = _giveNearestHit();
        return _theOne;
      }
    }
    return _theOne;
  }

// Die folgende Methode setzt eine Variable auf den Abstand des ersten Hits zum Ray-Ursprung und vergleicht sich zum 
// Abstand der anderen Hits zum Ray-Ursprung. Ist eine Distanz kürzer, so wird diese in die Variable geschrieben und
// der "nähere" Hit gespeichert. Der nahste Hit wird am Ende an trace zurückgegeben.

  Hit _giveNearestHit() {
    Hit nearestHit = new Hit();
    float distance = _hits.get(0).getHitLoc().dist(_ray.origin());
    
    for (int a=0; a<_hits.size(); a++) {      
      if (_hits.get(a).getHitLoc().dist(_ray.origin())<=distance) {
        nearestHit = _hits.get(a);
        distance = _hits.get(a).getHitLoc().dist(_ray.origin());
      }
    }
    return nearestHit;
  }




  //###########################AUSGABEN######################################


  Vektor surfaceNormV() {
    return _surfaceNormV.clone();
  }
  Vektor hitPointLoc() {
    return _theOne.getHitLoc().clone();
  }

}
