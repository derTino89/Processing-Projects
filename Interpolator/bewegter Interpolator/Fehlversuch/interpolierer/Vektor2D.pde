class Vektor2D{
float _x;
float _y;
  
  
  Vektor2D(float x, float y){
   _x=x;
   _y=y;
  }
  
  Vektor2D(MovableVektor2D input){
    _x=input.x();
    _y=input.y();
  }
 
  float getX(){
    return _x;
  }
  float getY(){
    return _y;
  }
  
  Vektor2D multS(float x){
   return new Vektor2D(_x*x,_y*x);
  }
  
  Vektor2D addiereMV(MovableVektor2D input){
    return new Vektor2D(input.x(),input.y());
  }
  
  Vektor2D addiere(Vektor2D summand){
    return new Vektor2D(_x+summand.getX(),_y+summand.getY());
  }
  
  Vektor2D clone(){
   return new Vektor2D(_x,_y);
  }
  
}