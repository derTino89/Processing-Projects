Triangle gDreieck;
Vektor2D gPunktA;
Vektor2D gPunktB;
Vektor2D gPunktC;
void setup() {
  size(800,800);
  gPunktA = new Vektor2D(100,100);
  gPunktB = new Vektor2D(150,400);
  gPunktC = new Vektor2D(300,300);
  gDreieck = new Triangle(gPunktA,gPunktB,gPunktC);

}

void draw() {
  noCursor();
  background(155);
  fill(255);
  gDreieck.renderEmpty();
  Vektor2D attacker = new Vektor2D(mouseX,mouseY);  
  if(gDreieck.hasInside(attacker)){
    gDreieck.renderFilledRed();
  }
  ellipse(attacker.getX(),attacker.getY(),5,5);
}