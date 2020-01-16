class Stage {
  Scene _scene;

  Stage() {
    _scene=new Scene();
  }

  void dreipunktBeleuchtung() {
    _scene.addLight(new Vektor(900, 100, 800)); //rim
    _scene.addLight(new Vektor(900, 450, -150)); //NL
    _scene.addLight(new Vektor(100, 270, -50)); //HL
    //rim:
    _scene.getLight(0).setBrightness(1055);
    _scene.getLight(0).setColor(255, 255, 255);
    //NL:
    _scene.getLight(1).setBrightness(350);
    _scene.getLight(1).setColor(200, 200, 200);
    //HL:
    _scene.getLight(2).setBrightness(650);
    _scene.getLight(2).setColor(255, 255, 200);
    
    _scene.addOneFuckingSingleBallinTheMiddleOfTheScreen();
  }
  
  Scene getCurrentScene(){
    return _scene;
  }
}