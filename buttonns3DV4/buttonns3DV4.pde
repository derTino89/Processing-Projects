Screens gScreens;
ButtonFactory gButtons;
TicRenderClock gClock;
Mouse gMouse;
VisualObject2D gRing;
VisualObject3D gBall;
Attacker2D gTriangle;


void setup() {
  size(1000, 800, P2D);
  
  gClock = new TicRenderClock();
  gScreens = new Screens(gClock);
  gMouse = new Mouse(gClock);
  gRing = new VisualObject2D(new Vektor2D(width/2, height/2));
  gBall = new VisualObject3D(new Vektor3D(width/2, height/2, 0));
  gButtons = new ButtonFactory(gClock, gMouse);
  gTriangle = new Attacker2D();
  
  gClock.subscribe3D(gBall); 
  gClock.subscribe2D(gRing);
  gClock.subscribe2D(gTriangle);
    
  gButtons.addTab("2D-Object", new switchToo2D(gScreens));
  gButtons.addTab("3D-Object", new switchToo3D(gScreens));

  gButtons.addButton("LEFT", new moveLeft(gRing));
  gButtons.addButton("RIGHT", new moveRight(gRing));
  gButtons.addButton("UP", new moveUp(gRing));
  gButtons.addButton("DOWN", new moveDown(gRing));
  gButtons.addButton("FILL", new fillMe(gRing));
  gButtons.addButton("UN-FILL", new unfillMe(gRing));
  gButtons.addButton("ENLARGE", new enlarge(gRing, gBall));

  gButtons.addButton3D("LEFT 3D", new moveLeft3D(gBall));
  gButtons.addButton3D("RIGHT 3D", new moveRight3D(gBall));
  gButtons.addButton3D("UP 3D", new moveUp3D(gBall));
  gButtons.addButton3D("DOWN 3D", new moveDown3D(gBall));
  gButtons.addButton3D("FILL 3D", new fillMe3D(gBall));
  gButtons.addButton3D("UN-FILL 3D", new unfillMe3D(gBall));
  gButtons.addButton3D("ENLARGE", new enlarge3D(gBall));
}

void draw() {
  background(100);
  gScreens.screen3D();
  gScreens.screen2D();

  gScreens.imageScreen3D();
  gScreens.imageScreen2D();

}
void mousePressed() {
  gMouse.mouseDown();
}