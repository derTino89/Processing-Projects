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
  
  Vektor2D addiereV(Vektor2D Vinput){
    //Vinput = new Vektor2D(Vinput.getX(),Vinput.getY());
    Vektor2D VSumme;
    VSumme = new Vektor2D(_x+Vinput.getX(),_y+Vinput.getY());
    return VSumme;
  }
  
  Vektor2D multS(float Skalar){
    Vektor2D VmultS;
    VmultS = new Vektor2D(_x*Skalar,_y*Skalar);
    return VmultS;
  }
  
  float multV(Vektor2D input){
    float Skalarprodukt;
    Skalarprodukt = (_x*input.getX())+(_y*input.getY());
    return Skalarprodukt;
  }
  
  float getX(){
    return _x;
  }
  float getY(){
    return _y;
  }
  
}