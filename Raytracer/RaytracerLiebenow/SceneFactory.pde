
class SceneFactory {

  Scene  makeBallAndFloor() {
    Scene s=new Scene(); 
    s.addLight(new Vektor(350,0,200));   
    s.getLight(0).setBrightness(500);  
    s.addOneFuckingSingleBallinTheMiddleOfTheScreen(); 
    s.addTriangle(new Vektor(50,500,100),new Vektor(width-50,500,100),new Vektor(50,350,1600));  
    s.addTriangle(new Vektor(50,350,1600),new Vektor(width-50,500,100),new Vektor(width-50,350,1600));
    return s;
  }

}
