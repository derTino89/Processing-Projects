Screen gPixels;
Stage gStage;

void setup() {
  size(1200, 900);
  gStage = new Stage();

  //gScene.addRandomBalls(70);
  //gScene.add_N_BallsOnACircle(7);

  gStage.dreipunktBeleuchtung();
  gPixels = new Screen(gStage.getCurrentScene());
}
void draw() {
  gPixels.render();
}