Clock gClock;
UI gCrosshair;
Target3D gMars;
PGraphics bitmap2D;
PGraphics bitmap3D;

void setup() {
  size(1024, 768, P2D);
  bitmap2D=createGraphics(1024, 738, P2D);
  bitmap3D=createGraphics(1024, 768, P3D);

  gMars=new Target3D(new Vektor3D(width/2, height/2, -300));
  gClock=new Clock();
  gCrosshair=new UI();

  gClock.subscribe2D(gCrosshair);
  gClock.subscribe3D(gMars);
}

void draw() {
  background(50);
  gClock.tic();
  bitmap2D.beginDraw(); 
  bitmap2D.clear();
  gClock.render2D(bitmap2D);
  bitmap2D.endDraw();
  bitmap3D.beginDraw();
  bitmap3D.clear();
  gClock.render3D(bitmap3D);
  bitmap3D.endDraw();

  image(bitmap2D, 0, 0);
  image(bitmap3D, 0, 0);
}