Screen gPixels;
Scene gScene;


void setup(){
  size(800,600);
  gScene = new Scene();
  gScene.addLight(new Vektor(0,-180,0));
  gScene.addRandomBalls(40);
  gPixels = new Screen(gScene);
  gPixels.render();

}