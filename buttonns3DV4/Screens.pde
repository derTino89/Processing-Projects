class Screens {
  float _transp2D=255;
  float _transp3D=0;
  PGraphics bitmap2D;
  PGraphics bitmap3D;
  TicRenderClock _clock;

  Screens(TicRenderClock clock) {
    bitmap2D = createGraphics(width, height, P2D); 
    bitmap3D = createGraphics(width, height, P3D);
    _clock=clock;
  }


  void screen2D() {
    bitmap2D.beginDraw();
    clear();
    _clock.tic();
    _clock.render2D(bitmap2D);
    bitmap2D.line(0,60,width,60);
    bitmap2D.endDraw();
  }                    // hier ist der Fehler, die clock rendert auf grund der abarbeitungsreihenfolge alles in 2D und 3D
  void screen3D() {
    bitmap3D.beginDraw();
    clear();
    _clock.tic();
    _clock.render3D(bitmap3D);
    bitmap3D.line(0,60,width,60);
    bitmap3D.endDraw();
  }
  
  void twoDforeGround(){
    _transp2D=255;
    _transp3D=0;
  }
  
  void threeDforeGround(){
    _transp2D=0;
    _transp3D=255;
  }
  
  void imageScreen2D(){  
  tint(255, _transp2D);
  image(bitmap2D, 0, 0);
  }
  
  void imageScreen3D(){  
  tint(255, _transp3D);
  image(bitmap3D, 0, 0);
  }
  
}