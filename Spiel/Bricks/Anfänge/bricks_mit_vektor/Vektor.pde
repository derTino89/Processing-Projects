class Vektor{
  float _x;
  float _y;
  float _vx;
  float _vy;
  
  Vektor(float x, float y){
   _x = x;
   _y = y;
  }
  
  void addiereX(float speedX){
    _x = _x+speedX;
  }
  void addiereY(float speedY){
    _y = _y+speedY;
  }
  
  float getX(){
    return _x;
  }
  float getY(){
    return _y;
  }
  
}