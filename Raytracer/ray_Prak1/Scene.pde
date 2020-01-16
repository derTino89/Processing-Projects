class Scene {
  Ray _Strahl;
  Vektor _licht;
  VisualObject _sphere;
  boolean _nothingHit;


  Scene() {
    _sphere=new VisualObject(new Vektor(width/2, height/2, 0));
    _licht=new Vektor(50, -255, 0);
  }

  color raytrace(Ray strahl) {
    _Strahl=strahl;
    if (_sphere.hits(_Strahl)) {
      _nothingHit=false;
      return color(_sphere.normV().skalar(_licht));
      //return color(180, 180, 90);
    } else {
      _nothingHit=true;
      return color(80);
    }
  }

}