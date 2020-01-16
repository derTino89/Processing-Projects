Screen gPixels;
Scene gScene;


void setup(){
  size(800,600);
  gScene = new Scene();
  gScene.addLight(new Vektor(200,-50,0));
  gScene.addRandomBalls(40);
  gPixels = new Screen(gScene);
  gPixels.render();

}
