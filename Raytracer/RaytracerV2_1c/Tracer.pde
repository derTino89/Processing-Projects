class Tracer {

  //ArrayList<Hit> _hits;
  Scene _scene;


  Tracer(Scene scene) {
    _scene = scene;
    //_hits = new ArrayList<Hit>();
  }


  Hit trace(Ray ray) {
    ArrayList<VisualObject> objects = _scene.getBalls();
    Hit theOne=new Hit();
    for (int i=0; i<objects.size(); i++) {
      if (!objects.get(i).getHitByRay(ray).isEmpty()) {
        theOne = _findNearestHit(theOne, objects.get(i).getHitByRay(ray), ray);
      }
    }
    return theOne;
  }


  float  _distance(Hit hit, Ray ray) {
    return hit.getHitLoc().dist(ray.origin());
  }
  
  Hit _findNearestHit(Hit oldHit, Hit newHit, Ray ray) {
    if(newHit.isEmpty())
      return oldHit;
    if (_distance(newHit, ray)<_distance(oldHit, ray))
      return newHit;
    else return oldHit;
  }
}