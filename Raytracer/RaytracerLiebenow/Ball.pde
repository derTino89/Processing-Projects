
class Ball extends RenderObject {

  Vektor _center;  
  float _rad; 

  //Konstruktor für Kugeln
  Ball(Vektor loc, float rad) {
    _center=loc.clone();
    _rad=rad;
  }


  Hit calculateHit(Ray ray) 
  {
    float t=_calculateNearestT(ray); 
    Vektor nearestPoint=ray.param(t); 
    if (!isInside(nearestPoint))
      return new Hit();
    return _makePreciseHit(nearestPoint,t,ray);
  }
  
  Hit _makePreciseHit(Vektor nearestPoint,float t,  Ray ray)
  {
    float deltaT=sqrt(_rad*_rad-_center.minusV(nearestPoint).lengthSquared());
    Vektor hitPoint=ray.param(t-deltaT);
    return new Hit(hitPoint, _surfaceNormV(hitPoint), true, t); 
  }
  

  boolean isInside(Vektor p)
  {
    return p.minusV(_center).lenght()<_rad; 
  }

  float _calculateNearestT(Ray ray)
  {
    return ray.direction().skalar(_center.minusV(ray.origin())); // t=d(c-o)
  }

  
  Vektor _surfaceNormV(Vektor hitpoint) 
  {
    Vektor faceDirection = new Vektor(hitpoint.minusV(_center)); 
    return faceDirection.normV();
  }
}
