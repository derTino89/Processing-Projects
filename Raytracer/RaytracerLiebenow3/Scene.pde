class Scene {
  ArrayList<Light> _Lights; 
  ArrayList<RenderObject> _Objects;
  Light _sun;

  Scene() {
    _Lights=new ArrayList<Light>();
    _Objects=new ArrayList<RenderObject>();
  }

  void addLight(Vektor loc) {
    _Lights.add(new Light(loc));
  }

 
  void addTriangle(Vektor a,Vektor b, Vektor c){
    _Objects.add(new Triangle(a,b,c)); 
    _Objects.add(new Ball(a,10));
    _Objects.add(new Ball(b,10));
    _Objects.add(new Ball(c,10));
}

  void addOneFuckingSingleBallinTheMiddleOfTheScreen() {
    _Objects.add(new Ball(new Vektor (width/2, height/2, 500), 80));
  }

  //###########################AUSGABEN######################################

  ArrayList<RenderObject> getObjects(){
    return _Objects;
  }

  ArrayList<Light> getLights() {
    return _Lights;
  }

  Light getLight(int n) {
    return _Lights.get(n);
  }
}
