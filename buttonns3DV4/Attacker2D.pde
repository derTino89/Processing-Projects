class Attacker2D extends Receiver {
  Vektor2D _locTip;
  Vektor2D _locCorn1;
  Vektor2D _locCorn2;
  Vektor2D _norm;
  Vektor2D _normPre;
  Vektor2D _mid;
  float _wing;

  Attacker2D() {
    _locTip=new Vektor2D(400, 400);
    _mid = new Vektor2D(width/2, height/2);
  }


  void tic() {
    
    _normPre = _mid.subV(_locTip);
    _norm = _locTip.subV(_normPre);
    
    _locCorn1 = _norm.addV(new Vektor2D(_norm.getX(),-_norm.getY()));
    _locCorn2 = _norm.addV(new Vektor2D(-_norm.getX(),_norm.getY()));
    
    
    
    
    
    if (keyPressed && key==CODED) {
      if (keyCode==UP) {
        _locTip=_locTip.addV(new Vektor2D(0,-1));
        println(_locTip.getY());
      }
      if (keyCode==DOWN) {
        _locTip=_locTip.addV(new Vektor2D(0,1));
        println(_locTip.getY());
      }
    }
  }

  void render(PGraphics bitmap2D) {
    bitmap2D.fill(255);
    bitmap2D.line(_mid.getX(),_mid.getY(),_norm.getX(),_norm.getY());
    bitmap2D.fill(255,0,0);
    bitmap2D.ellipse(_norm.getX(),_norm.getY(),3,3);
    bitmap2D.noFill();
    bitmap2D.triangle(_locTip.getX(), _locTip.getY(), _locCorn1.getX(), _locCorn1.getY(), _locCorn2.getX(), _locCorn2.getY());
    bitmap2D.noFill();
  }
}