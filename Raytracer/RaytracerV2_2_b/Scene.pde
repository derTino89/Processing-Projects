class Scene {
  ArrayList<VisualObject> _Balls;
  ArrayList<Light> _Lights;
  Light _sun;
  
  Scene() {
    _Lights=new ArrayList<Light>();
  }

  void addLight(Vektor loc) {
    _Lights.add(new Light(loc));
  }

  void addRandomBalls(float n) {
    _Balls=new ArrayList<VisualObject>();

    for (int i=0; i<n; i++) {
      float x = random(0, width);
      float y = random(50, height);
      float z = random(150, 300);
      float rad = random(5, 60);
      _Balls.add(new VisualObject(new Vektor(x, y, z), rad));
    }
  }
  
  void addOneFuckingSingleBallinTheMiddleOfTheScreen(){
    _Balls=new ArrayList<VisualObject>();
    _Balls.add(new VisualObject(new Vektor (width/2,height/2,500),200));
  }



  //###########################AUSGABEN######################################


  ArrayList<VisualObject> getBalls() {
    return _Balls;
  }
  
  ArrayList<Light> getLights(){
    return _Lights;
  }

  Light getLight(int n) {
    return _Lights.get(n);
  }
}