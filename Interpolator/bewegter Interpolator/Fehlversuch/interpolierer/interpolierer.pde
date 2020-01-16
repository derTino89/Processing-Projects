ArrayList<Punkte> gPoints;
Interpol niklas;
int max=0;


void setup() {
  size(800, 800);
  gPoints=new ArrayList<Punkte>();
}


void draw() {
  background(168);
  for (int i=0; i<gPoints.size(); i++) {
    gPoints.get(i).render();
  }
  if (max==2) {
    if (niklas==null)
      niklas = new Interpol(new MovableVektor2D(gPoints.get(0).ausgabe()), new MovableVektor2D(gPoints.get(1).ausgabe()));
  }

  if (niklas!=null) 
  {
    niklas.tic();
    niklas.render();
  }
}

void mouseReleased() {
  if (max<=1) {
    gPoints.add(new Punkte(mouseX, mouseY));
    max++;
  }
}