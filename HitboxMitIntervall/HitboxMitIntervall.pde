Box2D gTestBox;
PGraphics bitmap2D;
Box2D gMouseBox;
Vektor2D mouse;
void setup() {
  size(800, 800, P2D);
  bitmap2D=createGraphics(800, 800, P2D);  
  gTestBox = new Box2D(new Vektor2D(200, 200), new Vektor2D(300, 300));
  mouse=new Vektor2D(100, 100);
  gMouseBox = new Box2D(mouse, new Vektor2D(20, 20));
}
void draw() {
  background(0);
  //mouse.setX(mouseX);
  //mouse.setY(mouseY);
  gMouseBox = new Box2D(new Vektor2D(mouseX,mouseY), new Vektor2D(20, 20));
  bitmap2D.beginDraw();
  bitmap2D.clear();
  if (gTestBox.hasInside(gMouseBox)) {
    bitmap2D.fill(0, 0, 200);
    println(12);
    gTestBox.render(bitmap2D);
  } else {
    bitmap2D.fill(50);
    gTestBox.render(bitmap2D);
  }
  //gMouseBox.tic(mouse);
  bitmap2D.fill(50, 200, 0);
  gMouseBox.render(bitmap2D);
  bitmap2D.endDraw();
  image(bitmap2D, 0, 0);
}