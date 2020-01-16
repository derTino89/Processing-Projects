Clock gClock;
UI gSurface;
Mouse gMouse;
ButtonFactory gButtons;
ExplosiveFactory gBombs;
ArrowControl gControlP2;
WASDControl gControlP1;
Player gPlayerOne;
Player gPlayerTwo;
Timer gCountdown;
PGraphics bitmap2D;
PGraphics bitmap3D;

void setup() {
  size(1024, 768, P2D);
  bitmap2D=createGraphics(1024, 768, P2D);
  bitmap3D=createGraphics(1024, 768, P3D);
  
  gClock=new Clock();
  gMouse=new Mouse(gClock);
  gButtons = new ButtonFactory(gClock, gMouse);
  gBombs = new ExplosiveFactory();
  gSurface=new UI();

  gPlayerOne = new Player(gSurface, gBombs, new Vektor2D(200, 200));
  gPlayerTwo = new Player(gSurface, gBombs, new Vektor2D(width-200, 200));
  gControlP2 = new ArrowControl(gPlayerTwo, gSurface);
  gControlP1 = new WASDControl(gPlayerOne);
  gCountdown=new Timer(100);

  gClock.subscribe2D(gSurface);
  gClock.subscribe3D(gBombs);
  gClock.subscribe2D(gPlayerOne);
  gClock.subscribe2D(gPlayerTwo);
  
  

}

void draw() {
  background(50, 0, 0);
  gClock.tic();
  bitmap2D.beginDraw(); 
  bitmap2D.clear();
  gClock.render2D(bitmap2D);
  bitmap2D.endDraw();
  bitmap3D.beginDraw();
  bitmap3D.clear();
  gClock.render3D(bitmap3D);
  bitmap3D.endDraw();
  
  if (gPlayerOne._die) {
    gCountdown.tic();
    if (gCountdown._tics<=0){
      gPlayerTwo.winner();
      gButtons.addButton("New Game", new restart(gPlayerOne, gPlayerTwo));
    }
  }
  if (gPlayerTwo._die) {
    gCountdown.tic();
    if (gCountdown._tics<=0){
      gPlayerOne.winner();
      gButtons.addButton("New Game", new restart(gPlayerOne, gPlayerTwo));
    }
  }

  image(bitmap2D, 0, 0);
  image(bitmap3D, 0, 0);
}

//void keyPressed(){

//}