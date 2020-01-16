class Screens {
  float _transp2D=255;
  float _transp3D=0;
  float _transpRender=0;
  PGraphics bitmap2D;
  PGraphics bitmap3D;
  PGraphics rendermap;
  TicRenderClock _clock;
  Scene _scene;

  Screens(TicRenderClock clock, Scene scene) {
    bitmap2D = createGraphics(width, height, P2D); 
    bitmap3D = createGraphics(width, height, P3D);
    rendermap = createGraphics(width, height-60, P2D);
    _clock=clock;
    _scene=scene;
  }


  void screen2D() {
    bitmap2D.beginDraw();
    clear();
    _clock.tic();
    _clock.render2D(bitmap2D);
    bitmap2D.line(0, 60, width, 60);
    bitmap2D.endDraw();
  }                    
  void screen3D() {
    bitmap3D.beginDraw();
    clear();
    _clock.tic();
    _clock.render3D(bitmap3D);
    bitmap3D.line(0, 60, width, 60);
    bitmap3D.endDraw();
  }
  void renderScreen() {
    rendermap.beginDraw();
    clear();
    _clock.tic();
    _clock.render2D(bitmap2D);
    Screen view = new Screen(_scene);
    view.render(rendermap);
    rendermap.endDraw();
  }

  void twoDforeGround() {
    _transp2D=255;
    _transp3D=0;
    _transpRender=0;
  }

  void threeDforeGround() {
    _transp2D=0;
    _transp3D=255;
    _transpRender=0;
  }
  void renderForeGround() {
    _transp2D=255;
    _transp3D=0;
    _transpRender=255;
  }

  void imageScreen2D() {  
    tint(255, _transp2D);
    image(bitmap2D, 0, 0);
  }

  void imageScreen3D() {  
    tint(255, _transp3D);
    image(bitmap3D, 0, 0);
  }
  void imageRenderScreen() {
    tint(255, _transpRender);
    image(rendermap, 0, 0);
    image(bitmap2D,0,0);
  }
}
