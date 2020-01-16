// jb20180515 Der Ball hängt nun explizit vom Balken ab.
// Das kann man nicht übersehen, der Konstruktor fordert eine Instanz von Balken ein.
// Nun greift der Ball nicht mehr auf die globale Variable gbar zu. Er weiß nicht, daß sie global ist.
// nur Move benoetigt den Zugriff auf den bar.
// Wenn es gelänge, die Kollisionsberechnung von Move zu trennen dann
// wäre vermutlich nur noch in der Kollisionsberechnung der Zugriff auf bar noetig.
// Und dann könnte man vermutlich sogar die ganze Abhängigkeit loswerden. 
// aber eines nach dem Anderen. 
// Versuchen Sie, zunächst Ball auch klarer und kürzer zu beommen, ähnlich, wie ich es bei
// Balken gemacht habe. Verwenden Sie konsequent Vektoren, wo sie hingehören.
// Da, wo der Ball eine box ist, sollte man das auch an den verwendeten Klassen sehen können.
// Danach sehen wir weiter. ok?

// Viele Grüße
// Jens Bendig


class Ball // jb20180515 Klasse in Singular umbenannt. Das hier repräsentiert nur einen Ball!
{

  Vektor2D _locBall;     //Ortsvektor Ball
  float _speedX;         // jb20180515 _speedX, _speedY sieht für mich auch aus, wie ein Vektor2D
  float _speedY;         
  float _diam;           //Balldurchmesser // jb20180515 Kommentar wird redundant, wenn Variable _diameter heisst.
  color _farbe = color(30); // jb20180515 Typ auf color gewechselt

  TTracer _t;
  int _tracerlaenge; // jb20180515 Typwechsel auf int, denn es geht um eine ganze zahl

  Balken _bar; // jb20180515 Ball braucht zur Zeit Balken, wir machen das hier deutlich

  Ball(float x, float y, float r, Balken theBar) {
    _bar=theBar; // jb20180515 Abhängigkeit von Balken hier explizit gemacht (!)
    _diam = r;                       //Balldurchmesser
    _locBall = new Vektor2D(x, y);   //Ballkoordinaten bekommen eigenen Vektor
    _speedX = random(-10, 10);       //Ballrichtung // jb 20180515 Ball-BewegungsGeschwindigkeit x-Komponente
    _speedY = -8;                    //Ballgeschwindigkeit // jb20180515 Ball-Bewegungsgeschwindigkeit y-Komponente

    _tracerlaenge = 20;          
    _t = new TTracer(_tracerlaenge, _diam);
  }

  // jb20180515 Methode herausgezogen aus move
  void _bounceScreenBoundary()
  {
    if (_locBall.getY()<=0) {
      _speedY=-_speedY;
    }
    if (_locBall.getX()+_diam>=width || _locBall.getX()<0) {
      _speedX=-_speedX;
    }
  }

  // jb20180515 move ist unangenehm lang
  // kann man move 
  void move() {     

    _locBall.addiereY(_speedY); //jb20180515 Als Vektorrechnung würde hier stehen: _loc=_loc.add(speed);
    _locBall.addiereX(_speedX);

    _bounceScreenBoundary(); // jb20180515 Methodenname erspart Kommentar


    //Abprallen am Balken: (sollte die Hitbox von der Seite getroffen werden, ändert sich trotzdem die Y-Richtung  ==>  DOOF)
    // 
    if (_bar.isInside(_locBall, _diam)) // jb20180515 Habe hier Schwierigkeiten mit Ihrem Kollisionskonzept. Sie übergeben keinen Punkt, sondern einen Punkt und einen Radius. 
    {
      _speedY=-_speedY;
    }


    //Abprallen an den Bricks  
    if (gBrickfab.collide1(_locBall, _diam)) {
      _speedY=-_speedY;
      _bar.werdebreiter();
    } 

    if (gBrickfab.collide2(_locBall, _diam)) {
      _speedY=-_speedY;
      _bar.breitenreset(); // jb 20180515 Direktes Gespräch zwischen Ball und gbar leider über Globale Variable
      _bar.changeColor(); // jb 20180515 Direktes Gespräch zwischen Ball und gbar leider über Globale Variable
    }

    _t.move(_locBall.getX(), _locBall.getY());            // Tracerbewegung
  }


  //Rendern des Balles/Quadrates + seinen Tracer

  void render() {
    fill(_farbe++, 120, 50);    
    rect(_locBall.getX(), _locBall.getY(), _diam, _diam);
    _t.render();
    if (_locBall.getY()>height) {
      _bar.breitenreset(); // jb20180515 gehoert nicht zu render, her zu move
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