Vektor2D punkt1;
Vektor2D punkt2;
Interpol inter;

void setup(){
  size(800,800);
  punkt1 = new Vektor2D(100,100);
  punkt2 = new Vektor2D(300,400);
  inter=new Interpol(punkt1,punkt2);
}

void draw(){
  background(100);
  ellipse(punkt1.getX(),punkt1.getY(),20,20);
  ellipse(punkt2.getX(),punkt2.getY(),20,20);
  inter.ticloop();
  inter.render();
}