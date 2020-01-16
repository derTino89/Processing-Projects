class Scene {
  ArrayList<VisualObject> _Balls;
  Light _sun;


  void addLight(Vektor light) {
    _sun=new Light(light);
  }

  void addRandomBalls(float n) {
    _Balls=new ArrayList<VisualObject>();
    float x = 50;
    float y = 50;

    for (int i=0; i<n; i++) {
      float z = random(50, 200);
      float rad = random(20, 50);
      Vektor loc=new Vektor(x, y, z);
      _Balls.add(new VisualObject(loc, rad));
      x+=random(100,150);
      if(x>=width-rad/2){
        y +=random(80,120);
        x=50;
      }
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
