class Scene {
  ArrayList<VisualObject> _Balls;
  Vektor _light;
  VisualObject _sphere;
  Scene() {
  }

  void addOneBall(Vektor loc, float size) {
    _sphere=new VisualObject(loc, size, "sphere");
  }
  void addLight(Vektor light) {
    _light=light.clone();
  }

  void addRandomBalls(float n) {
    _Balls=new ArrayList<VisualObject>();
    for (int i=0; i<n; i++) {
      float x = random(0, width);
      float y = random(50, height);
      float z = random(-50,50);
      float rad = y*0.15;//random(10, 80);
      _Balls.add(new VisualObject(new Vektor(x, y, z), rad, "sphere"));
    }
  }









  //###########################AUSGABEN######################################

  VisualObject getBall() {
    return _sphere;
  }

  ArrayList<VisualObject> getBalls() {
    return _Balls;
  }

  Vektor getLight() {
    return _light.clone();
  }
}
