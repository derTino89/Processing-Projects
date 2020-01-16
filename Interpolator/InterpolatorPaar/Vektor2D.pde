class Vektor2D{
float _x;
float _y;

 Vektor2D(float x, float y){
  _x=x;
  _y=y;
 }
 Vektor2D(Vektor2D another){
   _x=another.getX();
   _y=another.getY();
 }
 
 Vektor2D clone(){
  return new Vektor2D(this); 
 }
 
 Vektor2D plus(Vektor2D input){
   return new Vektor2D(input.getX()+_x,input.getY()+_y);
 }
 
 Vektor2D malZahl(float x){
  return new Vektor2D(_x*x,_y*x); 
 }
 
 float getX(){
   return _x;
 }
 
 float getY(){
   return _y;
 }
}