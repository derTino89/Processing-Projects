class Scene {
  ArrayList<VisualObject> _Balls;
  Light _sun;


  void addLight(Vektor light) {
    _sun=new Light(light);
  }

  void addRandomBalls(float n) {
    _Balls=new ArrayList<VisualObject>();

    for (int i=0; i<n; i++) {
      float x = random(0, width);
      float y = random(50, height);
      float z = random(150,300);
      float rad = random(5, 60);
      _Balls.add(new VisualObject(new Vektor(x, y, z), rad));
    }
  }



  //###########################AUSGABEN######################################


  ArrayList<VisualObject> getBalls() {
    return _Balls;
  }

  Vektor getLight() {
    return _sun.getLight();
  }
}
