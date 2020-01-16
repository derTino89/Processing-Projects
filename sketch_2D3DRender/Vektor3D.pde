class Vektor3D{
float _x;
float _y;
float _z;

Vektor3D(float x, float y, float z){
  _x=x;
  _y=y;
  _z=z;
}
Vektor3D (Vektor3D another) {
    _x=another._x;
    _y=another._y;
    _z=another._z;
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

Vektor3D plusV(Vektor3D summand) {
    return new Vektor3D(_x+summand._x, _y+summand._y, _z+summand._z);
  }
  Vektor3D minusV(Vektor3D summand) {
    return new Vektor3D(_x-summand._x, _y-summand._y, _z-summand._z);
  }
  Vektor3D multi(float n) {
    return new Vektor3D(_x*n, _y*n, _z*n);
  }
  Vektor3D normV() {
    return new Vektor3D(this._x/this.lenght(), this._y/this.lenght(), this._z/this.lenght());
  }
  Vektor3D plusY(float y){
    return new Vektor3D(_x,_y+y,_z);
  }

  float dist(Vektor3D v) {
    float Xnew=_sqr(_x-v._x);
    float Ynew=_sqr(_y-v._y);
    float Znew=_sqr(_z-v._z);
    return sqrt(Xnew+Ynew+Znew);
  }

  float skalar(Vektor3D v) {
    float Xnew=_x*v._x;
    float Ynew=_y*v._y;
    float Znew=_z*v._z;
    return Xnew+Ynew+Znew;
  }
  Vektor3D umdreh() {
    return new Vektor3D(-_x, -_y, -_z);
  }

  float lenght() {
    return(sqrt(_x*_x+_y*_y+_z*_z));
  }

  float _sqr(float n) {
    return n*n;
  }
  Vektor3D clone() {
    return new Vektor3D(_x, _y, _z);
  }
  void setX(float x){
    _x=x;
  }
  void setY(float y){
    _y=y;
  }

}
