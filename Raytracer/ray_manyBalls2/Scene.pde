class Scene {
  Ray _Strahl;
  Vektor _licht;
  Shader _shader;
  ArrayList<VisualObject> _Balls;

  Scene() {
    _Balls=new ArrayList<VisualObject>();
    _licht=new Vektor(150, -150, 0);
    _shader=new Shader(_Balls);
    for (int i=0; i<25; i++) {
      _Balls.add(new VisualObject(new Vektor(random(0, width), random(0, height), 0), random(30, 100)));
    }
  }

  color raytrace(Ray strahl) {
    int _ballColor=0;
    for (int i=0; i<_Balls.size(); i++) {
      if (_Balls.get(i).hits(strahl)) {
        _ballColor=_shader.shade(_licht, _Balls.get(i).surfaceNormV(), _Balls.get(i).getHit());
        //_ballColor=color(_Balls.get(i).surfaceNormV().skalar(_licht));
        return _ballColor;
      } else _ballColor = color(80, 0, 10);
    }
    return _ballColor;
  }
}