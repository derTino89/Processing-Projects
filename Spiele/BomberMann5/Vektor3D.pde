class Vektor3D{
float _x;
float _y;
float _z;

Vektor3D(float x, float y, float z){
  _x=x;
  _y=y;
  _z=z;
}

Vektor3D clone(){
  return new Vektor3D(_x,_y,_z);
}
Vektor3D addV(Vektor3D v){
  return new Vektor3D(_x+v.getX(),_y+v.getY(), _z+v.getZ());
}
float getX(){
  return _x;
}

float getY(){
  return _y;
}
float getZ(){
  return _z;
}



}