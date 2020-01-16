class Box {
  Vektor2D _vBoxOrt;
  Vektor2D _vBoxGroesse; 

  //Konstruktor der Box mit Ort und Größe
  Box(Vektor2D location, Vektor2D size) {
    _vBoxOrt=location.clone();
    _vBoxGroesse=size.clone();
  }

  //Aktualisierung der Vektoren 
  void tic(Vektor2D loc) {
    _vBoxOrt=loc.clone();
  }
  void grow(Vektor2D size) {
    _vBoxGroesse=size.clone();
  }


  //Ausgabe der 4 Ecken (upper left, upper right, lower left, lower right)
  Vektor2D ulCorn() {
    return new Vektor2D(_vBoxOrt);
  }
  Vektor2D urCorn() {
    return new Vektor2D(_vBoxOrt.getX()+_vBoxGroesse.getX(), _vBoxOrt.getY());
  }
  Vektor2D llCorn() {
    return new Vektor2D(_vBoxOrt.getX(), _vBoxOrt.getY()+_vBoxGroesse.getY());
  }
  Vektor2D lrCorn() {
    return new Vektor2D(_vBoxOrt.getX()+_vBoxGroesse.getX(), _vBoxOrt.getY()+_vBoxGroesse.getY());
  }


  // Zeichnen der Box
  void render() {
    rect(_vBoxOrt.getX(), _vBoxOrt.getY(), _vBoxGroesse.getX(), _vBoxGroesse.getY());
  }


  //prüfen ob eine Koordinate mit zusätzlicher Kantenlänge eines Quadrates innerhalb der Box ist
  boolean isInside(Vektor2D here, float r) {

    return !isOutside(here, r);
  }

  boolean isOutside(Vektor2D here, float r) {
    if (isOutsideX(here, r)) {
      return true;
    }
    if (isOutsideY(here, r)) {
      return true;
    }
    return false;
  }

  boolean isOutsideX(Vektor2D here, float r) {
    if (here.getX()+r<=_vBoxOrt.getX()) {
      return true;
    } else if (here.getX()>=_vBoxOrt.getX()+_vBoxGroesse.getX()) {
      return true;
    } 
    return false;
  }

  boolean isOutsideY(Vektor2D here, float r) {
    if (here.getY()+r<=_vBoxOrt.getY()) {
      return true;
    } else if (here.getY()>=_vBoxOrt.getY()+_vBoxGroesse.getY()) {
      return true;
    }
    return false;
  }
}