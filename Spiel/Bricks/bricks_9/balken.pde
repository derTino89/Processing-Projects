class Balken {
  Box _balken;
  float _breite;  //wird im Programm verändert
  float _hoehe;   //bleibt konst.
  Vektor2D _balkenGroesse;
  Vektor2D _balkenOrt;

  int _speed;    //Balkengeschwindigkeit
  int _balkenwachstumsrate=20;
  int _anfangsbreite;

  float _zufallR=80;
  float _zufallG=80;
  float _zufallB=0;

  //Konstruktor erschafft Balken
  Balken() {
    _anfangsbreite = 120;
    _hoehe=20;
    _breite=_anfangsbreite;    
    _balkenGroesse = new Vektor2D(_breite, _hoehe);
    _speed=25;
    _balkenOrt=new Vektor2D(width/2-(_balkenGroesse.getX()/2), height-60);
    _balken=new Box(_balkenOrt, _balkenGroesse);
  }


  // Balken soll innerhalb des Bildes mit den Pfeiltasten horizontal bewegt werden
  void move() {    
    if (keyPressed) {
      if (key==CODED) { 
        if (keyCode==LEFT && _balkenOrt.getX()>0) {
          _balkenOrt.setX(_balkenOrt.getX()-_speed);
        }
        if (keyCode==RIGHT && _balkenOrt.getX()<width-_balkenGroesse.getX()) {
          _balkenOrt.setX(_balkenOrt.getX()+_speed);
        }
      }
    }
    _balken.tic(_balkenOrt);
  }

  void render() {
    fill(_zufallR, _zufallG, _zufallB);
    _balken.grow(_balkenGroesse);
    _balken.render();
  } 


  // Hitbox
  boolean isInside(Vektor2D here, float r) {
    if (_balken.isInside(here, r)) {
      return true;
    }
    return false;
  }



  void changecolorofbalken() {
    _zufallR=random(0, 255);
    _zufallG=random(0, 255);
    _zufallB=random(0, 255);
  }
  void werdebreiter() {
    _balkenGroesse.setX(_breite+_balkenwachstumsrate);
    _breite=_breite+_balkenwachstumsrate;
    _balkenOrt.setX(_balkenOrt.getX()-_balkenwachstumsrate/2);
  }
  void breitenreset() {
    float mitte = _balkenOrt.getX()+_balkenGroesse.getX()/2;
    _balkenGroesse.setX(_breite=_anfangsbreite);    
    _balkenOrt.setX(mitte-_anfangsbreite/2);
  }


  // Ausgabe von Variablen
  float ausgabex() {
    return _balkenOrt.getX();
  }
  float ausgabey() {
    return _balkenOrt.getY();
  }
  float ausgabebreite() {
    return _balkenGroesse.getX();
  }
  float ausgabehoehe() {
    return _balkenGroesse.getY();
  }
}