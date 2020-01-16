class Vektor2D{
float _x;
float _y;

Vektor2D(float x, float y){
  _x=x;
  _y=y;
}

Vektor2D clone(){
  return new Vektor2D(_x,_y);
}
Vektor2D addV(Vektor2D v){
  return new Vektor2D(_x+v.getX(),_y+v.getY());
}
Vektor2D subV(Vektor2D v){
  return new Vektor2D(_x-v.getX(),_y-v.getY());
}
float getX(){
  return _x;
}

float getY(){
  return _y;
}



}