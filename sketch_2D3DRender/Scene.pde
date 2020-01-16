class Scene {
  ArrayList<VisualObject3D> _Balls;
  ArrayList<Light> _Lights;
  Light _sun;
  
  Scene() {
    _Balls=new ArrayList<VisualObject3D>();
    _Lights=new ArrayList<Light>();
  }

  void addLight(Vektor3D loc) {
    _Lights.add(new Light(loc));
  }

  void addBall(Vektor3D loc){
    _Balls.add(new VisualObject3D(loc));
  }



  //###########################AUSGABEN######################################


  ArrayList<VisualObject3D> getBalls() {
    return _Balls;
  }
  VisualObject3D getBall(int n){
    return _Balls.get(n);
  }

  Light getLight(int n) {
    return _Lights.get(n);
  }
}
