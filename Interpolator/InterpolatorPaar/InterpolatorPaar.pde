Interpol ginter;
ArrayList<Ballpairs> gBallpair;
ArrayList<Balls> gBall;


void setup() {
  size(800, 800);
  gBallpair = new ArrayList<Ballpairs>();
  gBall = new ArrayList<Balls>();
}

void draw() {
  background(100);
  for (int i=0; i<gBall.size(); i++) {
    gBall.get(i).render();
  }
  for (int i=0; i<gBallpair.size(); i++) {
    gBallpair.get(i).interpolTicLoop();
  }
}

void mouseReleased() {

  gBall.add(new Balls(mouseX, mouseY));

  // Von einer Kugel zur nächsten:

  //if(gBall.size()>=2){
  //  for(int i=gBall.size()-1;i<gBall.size();i++){ 
  //    gBallpair.add(new Ballpairs(gBall.get(i),gBall.get(i-1)));
  //  }
  //}


  // Innerhalb Kugelpaar:
  if (gBall.size()>=1) {
    for (int i = gBall.size()-1; i>gBall.size()-2; i--) {
      if (i%2!=0) {
        gBallpair.add(new Ballpairs(gBall.get(i), gBall.get(i-1)));
      }
    }
  }
}