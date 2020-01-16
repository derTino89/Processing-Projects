class Vektor2D{
float _x;
float _y;
 
 Vektor2D(float x, float y){
   _x=x;
   _y=y;
 }
 
 float getX(){
   return _x;
 }
 float getY(){
   return _y;
 }
 Vektor2D add(Vektor2D summand){
  return new Vektor2D(summand.getX()+_x,summand.getY()+_y); 
 }
  
}