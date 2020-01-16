ArrayList<Punkte> gPoints;
Interpol niklas;
int max=0;
Tracer gTracy;

void setup() {
  size(800, 800);
  gPoints=new ArrayList<Punkte>();
  gTracy=new Tracer(2000,10);
}


void draw() {
  background(168);
  //for (int i=0; i<gPoints.size(); i++) {
  //  gPoints.get(i).render();
  //  gPoints.get(i).move(new Vektor2D(1,1));
  //}
  if (max==2) {
    if (niklas==null)
      niklas = new Interpol(new MovableVektor2D(gPoints.get(0).ausgabe()), new MovableVektor2D(gPoints.get(1).ausgabe()));
  }

  if (niklas!=null) 
  {
    niklas.ticloop();
    niklas.render();
    gTracy.trace(niklas.runner().getX(),niklas.runner().getY());
    gTracy.render();
  }
}

void mouseReleased() {
  if (max<=1) {
    gPoints.add(new Punkte(mouseX, mouseY));
    max++;
  }
}