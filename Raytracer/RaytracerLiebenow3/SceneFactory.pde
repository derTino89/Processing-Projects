// jb20190514 Auch sehr aufgeräumt, Herr Liebenow!
// ich habe hier auch mal eine Umbenennung vorgenommen, denn bei SceneFactory denkt man an "Bühne", also an Objekte und Beleuchtung

class SceneFactory {

  Scene  makeBallAndFloor() {
    Scene s=new Scene(); // reicht als lokale Variable völlig aus
    s.addLight(new Vektor(350,0,200));   
    s.getLight(0).setBrightness(800);  
    s.addOneFuckingSingleBallinTheMiddleOfTheScreen(); // jb20190517 Hahaha!
    s.addTriangle(new Vektor(50,500,100),new Vektor(width-50,500,100),new Vektor(50,350,1600));  
    s.addTriangle(new Vektor(50,350,1600),new Vektor(width-50,500,100),new Vektor(width-50,350,1600));
    return s;
  }
  
  //Scene getCurrentScene(){
  //  return _scene;
  //}
}
