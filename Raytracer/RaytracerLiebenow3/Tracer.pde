class Tracer {

  Scene _scene;


  Tracer(Scene scene) {
    _scene = scene;
  }


  Hit trace(Ray ray) {
    ArrayList<RenderObject> objects = _scene.getObjects();
    Hit theOne=new Hit();
    for (int i=0; i<objects.size(); i++)
    {
      Hit foundHit=objects.get(i).calculateHit(ray); 
      if (!foundHit.isEmpty() ) 
        theOne = _chooseBest(theOne, foundHit);
    } 
    return theOne;
  }

  Hit _chooseBest(Hit hit1, Hit hit2) 
  {
    if (hit2.isEmpty())
      return hit1;
    if (hit1.isEmpty())
      return hit2;

    if (hit2.get_distance_on_ray()<hit1.get_distance_on_ray())
      return hit2;
    else 
    return hit1;
  }
}
