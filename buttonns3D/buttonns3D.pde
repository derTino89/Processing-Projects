ButtonFactory gButtons;
TicRenderClock gClock;
Mouse gMouse;
Command gButtonFunction;
VisualObject gObject;
VisualObject3D gBall;
//PGraphics bitmap2D;
PGraphics bitmap3D;

void setup() {
  size(1000, 800, P3D);
  //bitmap2D = createGraphics(width,height,P2D); 
  bitmap3D = createGraphics(width, height,P3D);
  gClock = new TicRenderClock();
  gMouse = new Mouse(gClock);
  gObject = new VisualObject(new Vektor2D(width/2,height/2));
  gBall = new VisualObject3D(new Vektor3D(0,0,0));
  gClock.subscribe(gBall);
  gButtonFunction=new Command(gObject);
  gButtons=new ButtonFactory(gClock, gMouse);
  gClock.subscribe(gObject);
  gButtons.addButton("LEFT", new moveLeft(gObject));
  gButtons.addButton("RIGHT",new moveRight(gObject));
  gButtons.addButton("UP", new moveUp(gObject));
  gButtons.addButton("DOWN", new moveDown(gObject));
  gButtons.addButton("FILL", new fillMe(gObject));
  gButtons.addButton("UN-FILL", new unfillMe(gObject));
  
  
  gButtons.addButton3D("LEFT 3D", new moveLeft3D(gBall));
  gButtons.addButton3D("RIGHT 3D",new moveRight3D(gBall));
  gButtons.addButton3D("UP 3D", new moveUp3D(gBall));
  gButtons.addButton3D("DOWN 3D", new moveDown3D(gBall));
  gButtons.addButton3D("FILL 3D", new fillMe3D(gBall));
  gButtons.addButton3D("UN-FILL 3D", new unfillMe3D(gBall));
  
  
}

void draw() {
  background(50);
 
  //bitmap3D.beginDraw();
  //clear();
  gBall.render();
  gClock.tic();
  gClock.render();
  //bitmap3D.endDraw();
  
  //bitmap2D.beginDraw();
  //clear();
  //gClock.tic();
  //gClock.render();
  //bitmap2D.endDraw();
    
  //image(bitmap3D,0,0);
  //image(bitmap2D,0,0);
  
 
}
void mousePressed(){
 gMouse.mouseDown(); 
}
