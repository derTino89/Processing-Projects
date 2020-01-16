class Vektor {
  float _x;
  float _y;
  float _z;

  Vektor(float x, float y, float  z) {
    _x=x;
    _y=y;
    _z=z;
  }
  Vektor clone() {
    return new Vektor(_x, _y, _z);
  }
  Vektor(Vektor another) {
    _x=another._x;
    _y=another._y;
    _z=another._z;
  }

  Vektor plusV(Vektor summand) {
    return new Vektor(_x+summand._x, _y+summand._y, _z+summand._z);
  }
  Vektor minusV(Vektor summand) {
    return new Vektor(_x-summand._x, _y-summand._y, _z-summand._z);
  }
  Vektor multi(float n) {
    return new Vektor(_x*n, _y*n, _z*n);
  }
  Vektor normV() {
    return new Vektor(this._x/this.lenght(), this._y/this.lenght(), this._z/this.lenght());
  }

  float dist(Vektor v) {
    float Xnew=_sqr(_x-v._x);
    float Ynew=_sqr(_y-v._y);
    float Znew=_sqr(_z-v._z);
    return sqrt(Xnew+Ynew+Znew);
  }

  float skalar(Vektor v) {
    float Xnew=_x*v._x;
    float Ynew=_y*v._y;
    float Znew=_z*v._z;
    return Xnew+Ynew+Znew;
  }
  Vektor umdreh() {
    return new Vektor(-_x, -_y, -_z);
  }

  float lenght() {
    return(sqrt(_x*_x+_y*_y+_z*_z));
  }

  float _sqr(float n) {
    return n*n;
  }
}