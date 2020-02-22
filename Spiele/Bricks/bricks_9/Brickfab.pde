class Brickfab {
  ArrayList<Bricks> _brick;      // Brickfabrik
  int _brickzahl =8;             // Anzahl der Bricks pro Reihe
  int _reihen = 4;


  //Konstruktor baut Brickmuster
  Brickfab() {
    _brick = new ArrayList<Bricks>();
    for (int a=50; a<width; a=a+(width/_brickzahl)) {         // Bricks werden anhand der Bildbreite positioniert
      for (int i=1; i<=_reihen; i++) {
        Vektor2D brickLoc;                                   // Bricks werden erzeugt
        brickLoc = new Vektor2D(a, i*50);
        _brick.add(new Bricks(brickLoc));
      }
    }
  }

  //Kollision mit blauen Bricks
  boolean collide1(Vektor2D location, float diam) {
    for (int i=0; i<_brick.size(); i++) {
      if (_brick.get(i).isInside(location, diam)) {
        if (_brick.get(i).ausgabeFarbe()!=200) {
          _brick.remove(i);
          return true;
        }
      }
    }
    return false;
  }

  //Kollision mit roten Bricks
  boolean collide2(Vektor2D location, float diam) {
    for (int i=0; i<_brick.size(); i++) {
      if (_brick.get(i).isInside(location, diam)) {
        if (_brick.get(i).ausgabeFarbe()==200) {
          _brick.remove(i);
          return true;
        }
      }
    }
    return false;
  }

  //Zeichnen der Bricks
  void render() {
    for (int e=0; e<_brick.size(); e++) { 
      _brick.get(e).render();
    }
  }
}