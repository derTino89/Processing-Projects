Interpol ginter;
ArrayList<Ballpair> gBallpairs;
ArrayList<Ball> gBalls;


void setup() {
  size(800, 800);
  gBallpairs = new ArrayList<Ballpair>();
  gBalls = new ArrayList<Ball>();
}

void draw() {
  background(100);
  for (int i=0; i<gBalls.size(); i++) {
    gBalls.get(i).render();
  }
  for (int i=0; i<gBallpairs.size(); i++) {
    gBallpairs.get(i).interpolTicLoop();
    gBallpairs.get(i).interpolTicLoopRender();
  }
}

void mouseReleased() {

  gBalls.add(new Ball(mouseX, mouseY));

  if (gBalls.size()>=1) {
    for (int i = gBalls.size()-1; i>gBalls.size()-2; i--) {
      if (i%2!=0) {
        gBallpairs.add(new Ballpair(gBalls.get(i), gBalls.get(i-1)));
      }
    }
  }
}