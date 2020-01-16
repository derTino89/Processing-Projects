// Interpol ginter; // jb20180524 unbenutzte globale Instanz auskommentiert
ArrayList<InterpolationAgent> gInterpolators; // jb20180524 Klasse Umbenannt, war missverständlich
ArrayList<Ball> gBalls; // jb20180524 Das sieht (mal wieder) nach einer Doppelspeicherung aus...Sie haben die Bälle anscheinend einmal in gBalls und dann noch einmal in den BallPairs gespeichert.


void setup() {
  size(800, 800);
  gInterpolators = new ArrayList<InterpolationAgent>();
  gBalls = new ArrayList<Ball>(); // jb20180524 Vermutlich ist dieses zweite globale Array überflüssig
}

void draw() {
  background(100);
  for (int i=0; i<gBalls.size(); i++) {
    gBalls.get(i).render(); // jb20180524 Hmmm. Die Bälle werden hier anscheinend gerendert. Bewegt werden Sie nie. Stimmt ja auch.
  }
  for (int i=0; i<gInterpolators.size(); i++) 
  {
    gInterpolators.get(i).interpolTicLoop(); // jb20180524 Hmmm. Anscheinend ist ein Ballpaar irgendwie ein Interpolator? 
    gInterpolators.get(i).interpolTicLoopRender(); //jb20180524 Hmmm. Klar, interpolTicLoopRender ist natürlich etwas anderes als interpolTicLoop
  }
}

void mouseReleased() {

  gBalls.add(new Ball(mouseX, mouseY));

  if (gBalls.size()>=1) {
    for (int i = gBalls.size()-1; i>gBalls.size()-2; i--) {
      if (i%2!=0) {
        gInterpolators.add(new InterpolationAgent(gBalls.get(i), gBalls.get(i-1)));
      }
    }
  }
}