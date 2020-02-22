class Box2D {
  Vektor2D _vBoxOrt;
  Vektor2D _vBoxGroesse; 
  Intervall _horizontal;
  Intervall _vertical;
  PGraphics _bitmap;

  Box2D(Vektor2D location, Vektor2D size) { 
    _vBoxOrt=location.clone();
    _vBoxGroesse=size.clone();
    _horizontal = new Intervall(location.getX(), location.getX()+size.getX());
    _vertical = new Intervall(location.getY(), location.getY()+size.getY());
  }


  void tic(Vektor2D loc) {
    _vBoxOrt=loc.clone();
    _horizontal.tic(_vBoxOrt.getX(), _vBoxOrt.getX()+_vBoxGroesse.getX());
    _vertical.tic(_vBoxOrt.getY(), _vBoxOrt.getY()+_vBoxGroesse.getY());
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



  void render(PGraphics bitmap2D) {
    _bitmap=bitmap2D;
    //_bitmap.stroke(100);
    _bitmap.rect(_vBoxOrt.getX(), _vBoxOrt.getY(), _vBoxGroesse.getX(), _vBoxGroesse.getY());
    _bitmap.noStroke();
  }


  boolean hasInside(Box2D another){

  if(this.getHori().hasInside(another.getHori())){
    if(this.getVerti().hasInside(another.getVerti())){
      return true;
    }return false;
  }return false;

}

  Intervall getHori() {
    return _horizontal;
  }
  Intervall getVerti() {
    return _vertical;
  }
  //boolean isInside(Vektor2D here) {

  //  return !isOutside(here);
  //}

  //boolean isOutside(Vektor2D here) {
  //  if (isOutsideX(here)) {
  //    return true;
  //  }
  //  if (isOutsideY(here)) {
  //    return true;
  //  }
  //  return false;
  //}

  //boolean isOutsideX(Vektor2D here) {
  //  if (here.getX()<=_vBoxOrt.getX()) {
  //    return true;
  //  } else if (here.getX()>=_vBoxOrt.getX()+_vBoxGroesse.getX()) {
  //    return true;
  //  } 
  //  return false;
  //}

  //boolean isOutsideY(Vektor2D here) {
  //  if (here.getY()<=_vBoxOrt.getY()) {
  //    return true;
  //  } else if (here.getY()>=_vBoxOrt.getY()+_vBoxGroesse.getY()) {
  //    return true;
  //  }
  //  return false;
  //}
}