class VisualObject{
Vektor _center;
float _rad;
float _t;
float _dist;
float _dt;

Ray _strahl;
Vektor _p;
Vektor _N;
Vektor _hit;

  VisualObject(Vektor loc){
    _center=loc.clone();
    _rad=200;
  }
  
boolean hits(Ray strahl){
  _strahl=strahl;
  // T ausrechnen:
  _t = _strahl.direction().skalar(_center.minusV(_strahl.origin()));
  
  // P ausrechnen
  _p=_strahl.param(_t);
  
  // Abstand
  _dist=_center.dist(_p);
  
  _dt = sqrt((_rad*_rad)-(_dist*_dist));
  
  
  if(_dist<(_rad*_rad))
    return true;
  else return false;
  

} 
Vektor normV(){
  //eintrittspunkt
  Vektor _hit = _strahl.param(_t-_dt);
  
  Vektor _N=new Vektor(_center.minusV(_hit)); 
  Vektor _norm = new Vektor(_N._x/_N.lenght(),_N._y/_N.lenght(),_N._z/_N.lenght());
  return _norm.clone();
}
  
void render(){
  translate(_center._x,_center._y,_center._z);
  sphere(_rad);
}


}