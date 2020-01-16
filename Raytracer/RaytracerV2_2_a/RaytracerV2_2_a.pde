Screen gPixels;
Scene gScene;


void setup(){
  size(800,600);
  gScene = new Scene();
  gScene.addLight(new Vektor(width/2,-50,50));
  gScene.addLight(new Vektor(0,height+20,50));
  gScene.getLight(0).setBrightness(250);
  gScene.getLight(0).setColor(250,100,50);
  gScene.getLight(1).setBrightness(250);
  gScene.getLight(1).setColor(50,250,50);
  gScene.addRandomBalls(1);
  gPixels = new Screen(gScene);
  

}
void draw(){
gPixels.render();
}
