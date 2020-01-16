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
      Hit foundHit=objects.get(i).calculateHit(ray); // jb20190404 Sie haben bisher den Hit zweimal berechnet, weil Ihre Methode ungut benannt war
      if (!foundHit.isEmpty()) 
        theOne = _chooseBest(theOne, foundHit, ray);
    } 

    return theOne;
  }


// jb20190404 Methode gehört auf hit, es ist ja die Berechnung von t. Das hat Ray mal gemacht. Warum es hier neu ausrechnen? Zumal man ja den "richtigen" Ray erst wiederfinden muss. Existiert der noch?
  float  _falscheTForensik(Hit hit, Ray ray) {
    return hit.getHitLoc().dist(ray.origin());
  }

  // jb20190404 Methode umbenannt - to find bedeutet suchen. Sie suchen hier nicht, sie haben schon gefunden
  // Ich habe auch die Übergabeparameter umbenannt, weil Sie suggeriert haben, daß man hier alte und neue Hits unterscheiden müsse.
  Hit _chooseBest(Hit hit1, Hit hit2, Ray ray) 
  {
    if (hit2.isEmpty())
      return hit1;
    if (hit1.isEmpty())
      return hit2;
    //jb20190404 Hier liegt nach meiner Ansicht ein Rechenfehler vor:
    //hit1 und hit2 wurden ja von verschiedenen Rays erzeugt.
    //Ihre Forensik geht aber hier davon aus, daß man den t-Paramter mit ein und demselben
    //Ray für beide Hits nachträglich noch einmal ausrechnen kann. Kann man nicht.
    // Im Falle von parallelen Primärstrahlen ist das aber zufällig richtig.
    // Erinnern Sie sich an meinen Hinweis zu dieser Sache im Praktikum?
    if (_falscheTForensik(hit2, ray)<_falscheTForensik(hit1, ray)) // Hier berechnen Sie ziemlich teuer zum zweiten Mal, was doch schon dem hit bekannt sein sollte: Sein t-Parameter
      return hit2;
    else 
    return hit1;
  }
}
