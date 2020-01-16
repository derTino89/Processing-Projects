class Ray {
  Vektor _d; // Richtung
  Vektor _o; // Ursprung

  
  Ray(Vektor start, Vektor direction) {  
    _o=start.clone();
    _d=direction.clone();//.normV(); 
  }

  Vektor param(float t) {
    Vektor p_t = new Vektor(_o.plusV(_d.multi(t)));
    return p_t;
  }




  //###########################AUSGABEN######################################

  Vektor direction() {
    return _d.clone();
  }
  Vektor origin() {
    return _o.clone();
  }
}
