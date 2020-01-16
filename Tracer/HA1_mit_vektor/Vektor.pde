class Vektor2D {
  float _x;
  float _y;

  Vektor2D(float x, float y) {
    _x=x;
    _y=y;
  }

  void setX(float x) {
    _x=x;
  }
  void setY(float y) {
    _y=y;
  }
  float getX() {
    return _x;
  }
  float getY() {
    return _y;
  }
  void addiereX(float sumX){
    _x=_x+sumX;
  }
  void addiereY (float sumY){
    _y=_y+sumY;
  }
}