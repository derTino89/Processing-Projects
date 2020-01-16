Screen gPixels;
Scene gScene;


void setup(){
  size(800,600);
  gScene = new Scene();
  gScene.addLight(new Vektor(width/2,-50,50));
  gScene.addRandomBalls(80);
  gPixels = new Screen(gScene);
  gPixels.render();

}
