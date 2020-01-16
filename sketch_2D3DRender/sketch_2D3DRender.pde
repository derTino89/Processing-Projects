Screens gScreens;
Scene gScene;
ButtonFactory gButtons;
TicRenderClock gClock;
Mouse gMouse;
VisualObject2D gRing;



void setup() {
  size(1000, 800, P2D);
  
  gClock = new TicRenderClock();
  gScene = new Scene();
  gScreens = new Screens(gClock, gScene);
  gMouse = new Mouse(gClock);
  gRing = new VisualObject2D(new Vektor2D(width/2, height/2));
  gScene.addBall(new Vektor3D(width/2,height/2,80));
  gScene.addLight(new Vektor3D(700,0,0));
  gButtons = new ButtonFactory(gClock, gMouse);
  
  gClock.subscribe3D(gScene.getBall(0)); 
  gClock.subscribe2D(gRing);
    
  gButtons.addTab("2D-Object", new switchToo2D(gScreens));
  gButtons.addTab("3D-Object", new switchToo3D(gScreens));
  gButtons.addTab("Render me", new switchTooRender(gScreens));

  gButtons.addButton("LEFT", new moveLeft(gRing, gScene.getBall(0)));
  gButtons.addButton("RIGHT", new moveRight(gRing, gScene.getBall(0)));
  gButtons.addButton("UP", new moveUp(gRing, gScene.getBall(0)));
  gButtons.addButton("DOWN", new moveDown(gRing, gScene.getBall(0)));
  gButtons.addButton("ENLARGE", new enlarge(gRing, gScene.getBall(0)));

}

void draw() {
  background(40,40,40);
  gScreens.screen3D();
  gScreens.screen2D();
  //gScreens.renderScreen();

  gScreens.imageScreen3D();
  gScreens.imageScreen2D();
  gScreens.imageRenderScreen();

}
void mousePressed() {
  gMouse.mouseDown();
}
