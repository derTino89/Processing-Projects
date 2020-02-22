class Vektor3D {
  float _x;
  float _y;
  float _z;

  Vektor3D(float x, float y, float z) {
    _x=x;
    _y=y;
    _z=z;
  }
  Vektor3D(Vektor3D here){
   _x=here.getX();
   _y=here.getY();
   _z=here.getZ();
  }

  float getX() {
    return _x;
  }
  float getY() {
    return _y;
  }
  float getZ() {
    return _z;
  }
  void moveX(float speed){
    _x+=speed;
  }
  void moveY(float speed){
    _y+=speed;
  }
  void moveZ(float speed){
    _z+=speed;
  }  
  Vektor3D clone(){
   return new Vektor3D(_x,_y,_z); 
  }
  Vektor3D multZahl(float n){
   return new Vektor3D(_x*n,_y*n,_z*n); 
  }
  Vektor3D plusV(Vektor3D V){
   return new Vektor3D(_x+V.getX(),_y+V.getY(),_z+V.getZ()); 
  }
}
