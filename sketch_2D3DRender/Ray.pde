class Ray {
  Vektor3D _d; // Richtung
  Vektor3D _o; // Ursprung

  
  Ray(Vektor3D start, Vektor3D direction) {  
    _o=start.clone();
    _d=direction.clone().normV(); 
  }

  Vektor3D param(float t) {
    Vektor3D p_t = new Vektor3D(_o.plusV(_d.multi(t)));
    return p_t;
  }




  //###########################AUSGABEN######################################

  Vektor3D direction() {
    return _d.clone();
  }
  Vektor3D origin() {
    return _o.clone();
  }
}
