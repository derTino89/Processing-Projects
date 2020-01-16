Box Kasten;
Vektor2D KOrt;
Vektor2D KSize;
Vektor2D mouse;

void setup(){
  size(1000,1000);
  KOrt=new Vektor2D(100,100);
  KSize=new Vektor2D(200,100);
  Kasten=new Box(KOrt,KSize);
   
}
void draw(){
  background(0);
  fill(150);
  Kasten.render();
  mouse=new Vektor2D(mouseX,mouseY);
  if(Kasten.isInside(mouse,0)){
    fill(255);
    textSize(48);
    text("INSIDE", 120, 120, 200, 100);
  }
  else {
    fill(255,0,0);
    textSize(46);
    text("OUTSIDE", 104, 120, 200, 100);
  }
}