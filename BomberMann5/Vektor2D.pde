class Vektor2D{
float _x;
float _y;

Vektor2D(float x, float y){
  _x=x;
  _y=y;
}
Vektor2D(Vektor2D newV){
  _x=newV.getX();
  _y=newV.getY();
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
float lenght(){
  return sqrt((_x*_x)+(_y*_y));
}
float getX(){
  return _x;
}

float getY(){
  return _y;
}



}