class Bricks {
  Box _brick;
  Vektor2D _brickSize;
  int _farbe;


  // Ein Brick wird gebaut: Blau(80%) oder Rot(20%)
  Bricks(Vektor2D location) {                     
    _brickSize = new Vektor2D(90, 20);
    _brick = new Box(location.clone(), _brickSize);
    int zufall = int(random(100));
    if (zufall<=20) {
      _farbe=200;
    } else _farbe =0;
  }

  void render() {        
    fill(_farbe, 20, 50);
    _brick.render();
  }


  // HITBOX
  boolean isInside(Vektor2D killer, float diam) {
    if (_brick.isInside(killer, diam)) {
      return true;
    }
    return false;
  }


  // AUSGABEN
  float ausgabeFarbe() {
    return _farbe;
  }

  float ausgabeBreite() {
    return _brickSize.getX();
  }

  float ausgabeHoehe() {
    return _brickSize.getY();
  }
}