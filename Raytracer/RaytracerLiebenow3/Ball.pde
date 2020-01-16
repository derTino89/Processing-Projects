// 20190517 Die klasse "Ball" sollte eher "Sphere" oder "Kugel" heißen. Aber ok.
// Sie ist aber unnötig kompliziert. Das hat damit zu tun, daß hier so einige Dinge veranstaltet werden, die 
// Ray machen sollte. Dieses Objekt war etwas gruselig, muss ich leider sagen.

class Ball extends RenderObject {

  Vektor _center;  
  float _rad; 

  //Konstruktor für Kugeln
  Ball(Vektor loc, float rad) {
    _center=loc.clone();
    _rad=rad;
  }


  Hit calculateHit(Ray ray) // jb20190517 leicht umgeschrieben - bild hat sich auch leicht verändert. hmmm.
  {
    float t=_calculateNearestT(ray); // ist das nicht viel klarer?
    Vektor nearestPoint=ray.param(t); // Strahlenkram macht ray
    if (!isInside(nearestPoint))
      return new Hit();
    return _makePreciseHit(nearestPoint,t,ray);
  }
  
  Hit _makePreciseHit(Vektor nearestPoint,float t,  Ray ray)
  {
    float deltaT=sqrt(_rad*_rad-_center.minusV(nearestPoint).lengthSquared());
    Vektor hitPoint=ray.param(t-deltaT);
    return new Hit(hitPoint, _surfaceNormV(hitPoint), true, t); // jb20190517 was, wenn ich statt true ein false einwerfe? Unnötige Fehlbedienmöglichkeit bei Hit
  }
  

  boolean isInside(Vektor p)
  {
    return p.minusV(_center).lenght()<_rad; // billiger wäre die Betrachtung der Quadrate...Wie berechnet man nochmal billigst lengthSquared()?
  }

  float _calculateNearestT(Ray ray) //  jb21090517 da sind sie nicht drauf gekommen, was?
  {
    return ray.direction().skalar(_center.minusV(ray.origin())); // t=d(c-o)
  }

  // zu unlesbar
  //float _distance_of_P(Ray ray) {
  //  return _center.minusV(_PointOnRay(ray)).lenght();
  //}

  //float _t(Ray ray) {
  //  return ray.direction().skalar(_center.minusV(ray.origin()));
  //}

  //Vektor _PointOnRay(Ray ray) {
  //  return ray.param(_t(ray));
  //}

  Vektor _surfaceNormV(Vektor hitpoint) // jb20190517 übergabeparameter verklarifiziert
  {
    Vektor faceDirection = new Vektor(hitpoint.minusV(_center)); 
    return faceDirection.normV();
  }

  //Vektor _HitPoint(Ray ray) {
  //  return ray.param(get_t_of_hitpoint(ray));
  //}

  // KREISCH, KREISCH!!!! KREISCH!!!!!!
  //float get_t_of_hitpoint(Ray ray) {
  //  float sqrDistance_of_P = _distance_of_P(ray)*_distance_of_P(ray); // VIEL VIEL ZU TEUER
  //  float dt = sqrt(_rad*_rad-sqrDistance_of_P);
  //  return _t(ray)-dt; // SIE HABEN T doch LAENGST BERECHNET
  //}


}
