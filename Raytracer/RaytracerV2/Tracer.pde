class Tracer {
  ArrayList<VisualObject> _objects;
  VisualObject Ball;
  boolean _hit;
  Hit _theOne;
  Vektor _surfaceNormV;
  
  
  Tracer() {
    _hit=false;
  }
  
  
  void lookForHitObject(Ray ray, Scene scene) {
    Ball=scene.getBall();
    _theOne = new Hit(Ball);
    if (_theOne.hits(ray)) {
      _hit=true;
      _surfaceNormV=_theOne.surfaceNormV();
      return;
    } else {
      _hit=false;
    }
  }

  void lookForHitArray(Ray ray, Scene scene) {
    _objects=scene.getBalls();
    for (int i=0; i<_objects.size(); i++) {
      _theOne = new Hit(_objects.get(i));
      if (!_theOne.hits(ray)) {
        _hit=false;
      } else {
        _hit=true;
        _surfaceNormV=_theOne.surfaceNormV();
        return;
      }
    }
  }
  
  
  
  
  
  //###########################AUSGABEN######################################
  
  
  Vektor surfaceNormV() {
    return _surfaceNormV.clone();
  }
  Vektor hitPointLoc() {
    return _theOne.getHitLoc().clone();
  }
  boolean hit() {
    return _hit;
  }
}
