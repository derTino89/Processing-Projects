Screen gPixels;
Scene gScene;


void setup() {
  size(1200, 900);
  gScene = new Scene();
  gScene.addLight(new Vektor(900, 100, 800)); //rim
  gScene.addLight(new Vektor(1000, 350, -150)); //NL
  gScene.addLight(new Vektor(100, 270,-50)); //HL
  //rim:
  gScene.getLight(0).setBrightness(1255);
  gScene.getLight(0).setColor(255, 255, 255);
  //NL:
  gScene.getLight(1).setBrightness(550);
  gScene.getLight(1).setColor(0, 200, 200);
  //HL:
  gScene.getLight(2).setBrightness(1250);
  gScene.getLight(2).setColor(255, 255, 155);
  //gScene.addRandomBalls(70);
  gScene.addOneFuckingSingleBallinTheMiddleOfTheScreen();
  gPixels = new Screen(gScene);
}
void draw() {
  gPixels.render();
}