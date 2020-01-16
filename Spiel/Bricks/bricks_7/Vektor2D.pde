class Vektor2D{
  float _x;
  float _y;

  
  Vektor2D(float x, float y){
   _x = x;
   _y = y;
  }
  
  void setX(float x){
   _x=x; 
  }
  
  void setY(float y){
   _y=y; 
  }
  
  void addiereX(float speedX){
    _x = _x+speedX;
  }
  
  void addiereY(float speedY){
    _y = _y+speedY;
  }
  
  // Addition zweier Vektoren
  
  Vektor2D addiereV(Vektor2D Vinput){
    _x=_x+Vinput.getX();
    _y=_y+Vinput.getY();
    Vektor2D VSumme;
    VSumme = new Vektor2D(_x,_y);
    return VSumme;
  }
  
  // Multiplikation mit einer skalaren Zahl
  
  Vektor2D multS(float Skalar){
    Vektor2D VmultS;
    VmultS = new Vektor2D(_x*Skalar,_y*Skalar);
    return VmultS;
  }
  
  // Skalarprodukt
  
  float multV(Vektor2D input){
    float Skalarprodukt;
    Skalarprodukt = (_x*input.getX())+(_y*input.getY());
    return Skalarprodukt;
  }
  
  
  
  // AUSGABEN
  
  float getX(){
    return _x;
  }
  float getY(){
    return _y;
  }
  
}