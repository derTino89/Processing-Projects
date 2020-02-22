class Balls {

  Vektor2D _locBall;     //Ortsvektor Ball
  float _speedX;         //Anfangsrichtung Ball in X
  float _speedY;         //Ballfluggeschwindigkeit
  float _diam;           //Balldurchmesser
  int _farbe = 30;       //Ballfarbe für alle gleich

  TTracer _t;
  float _tracerlaenge;



  Balls(float x, float y, float r) {
    _diam = r;                       //Balldurchmesser
    _locBall = new Vektor2D(x, y);   //Ballkoordinaten bekommen eigenen Vektor
    _speedX = random(-10, 10);       //Ballrichtung
    _speedY = -8;                    //Ballgeschwindigkeit

    _tracerlaenge = 20;          
    _t = new TTracer(_tracerlaenge, _diam);
  }


  void move() {     

    _locBall.addiereY(_speedY);
    _locBall.addiereX(_speedX);

   
    // Abprallen am Bildschirmrand:
    if (_locBall.getY()<=0) {
      _speedY=-_speedY;
    }
    if (_locBall.getX()+_diam>=width || _locBall.getX()<0) {
      _speedX=-_speedX;
    }


    //Abprallen am Balken: (sollte die Hitbox von der Seite getroffen werden, ändert sich trotzdem die Y-Richtung  ==>  DOOF)
    if (gbar.isInside(_locBall, _diam)) {
      _speedY=-_speedY;
    }


    //Abprallen an den Bricks  
    if (gBrickfab.collide1(_locBall, _diam)) {
      _speedY=-_speedY;
      gbar.werdebreiter();
    } 

    if (gBrickfab.collide2(_locBall, _diam)) {
      _speedY=-_speedY;
      gbar.breitenreset();
      gbar.changecolorofbalken();
    }


    _t.move(_locBall.getX(), _locBall.getY());            // Tracerbewegung
  }


  //Rendern des Balles/Quadrates + seinen Tracer

  void render() {
    fill(_farbe++, 120, 50);    
    rect(_locBall.getX(), _locBall.getY(), _diam, _diam);
    _t.render();
    if (_locBall.getY()>height) {
      gbar.breitenreset();
    }
  }

  //Prüft ob Ball unten aus dem Bildschirmrand verschwindet:
  boolean kill() {  
    if (_locBall.getY()>height) {
      return true;
    }
    return false;
  }


  // AUSGABEN

  Vektor2D ausgabeOrt() {
    return _locBall;
  }

  float ausgabeRad() {
    return _diam;
  }

  float ausgabeX() {
    return _locBall.getX();
  }

  float ausgabeY() {
    return _locBall.getY();
  }
}