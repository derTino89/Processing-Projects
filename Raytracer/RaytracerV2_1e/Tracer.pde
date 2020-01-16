class Tracer {

  Scene _scene;


  Tracer(Scene scene) {
    _scene = scene;
  }


  Hit trace(Ray ray) {
    ArrayList<VisualObject> objects = _scene.getBalls();
    Hit theOne=new Hit();
    for (int i=0; i<objects.size(); i++)
    {
      Hit foundHit=objects.get(i).calculateHit(ray); 
      if (!foundHit.isEmpty() ) 
        theOne = _chooseBest(theOne, foundHit);
    } 

    return theOne;
  }


// jb20190404 Methode gehört auf hit, es ist ja die Berechnung von t. Das hat Ray mal gemacht. Warum es hier neu ausrechnen? Zumal man ja den "richtigen" Ray erst wiederfinden muss. Existiert der noch?
// tl20190404 Methode wurde verschoben, in ihr wird der "t-Wert" auf einem Ray für den tatsächlichen Eintrittspunkt berechnet also (t-dt) und nicht
// der "t-Wert" für den Punkt P. Diese Berechnung ist nun ebenfalls bei der Hitberechnung im Visualobject und übergibt den Wert der Länge des Rays, von dem er
// getroffen wird (vom Ursprung bis zum Treffpunkt) an den Hit weiter.
// Somit sollten hit1 und hit 2 nun die Werte ihres eigenen rays gespeichert haben und vergleichbar sein.

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
