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

Vektor2D subt(Vektor2D subtrahent){
  return new Vektor2D(_x-subtrahent.getX(),_y-subtrahent.getY());
  
}

float skalar(Vektor2D faktor){
  return _x*faktor.getX()+_y*faktor.getY();
}

float getX(){
  return _x;
}

float getY(){
  return _y;
}


}