class Vektor2D {
  float _x;
  float _y;


  Vektor2D(float x, float y) {
    _x = x;
    _y = y;
  }

  Vektor2D(Vektor2D another) {
    _x=another._x;
    _y=another._y;
  }
  //Vektor2D clone() {
  //  return new Vektor2D(this);
  //}
  
  Vektor2D clone() {
    return new Vektor2D(_x, _y);
  } 

  void setX(float x) {
    _x=x;
  }

  void setY(float y) {
    _y=y;
  }

  void addiereX(float speedX) {
    _x = _x+speedX;
  }

  void addiereY(float speedY) {
    _y = _y+speedY;
  }


  // Addition zweier Vektoren
  Vektor2D addiereV(Vektor2D vInput) {
    _x=_x+vInput.getX();
    _y=_y+vInput.getY();
    Vektor2D vSumme;
    vSumme = new Vektor2D(_x, _y);
    return vSumme;
  }

  // Multiplikation mit einer skalaren Zahl
  Vektor2D multS(float skalar) {
    Vektor2D vmultS;
    vmultS = new Vektor2D(_x*skalar, _y*skalar);
    return vmultS;
  }

  // Skalarprodukt
  float multV(Vektor2D input) {
    float skalarprodukt;
    skalarprodukt = (_x*input.getX())+(_y*input.getY());
    return skalarprodukt;
  }



  // AUSGABEN
  float getX() {
    return _x;
  }
  float getY() {
    return _y;
  }
}