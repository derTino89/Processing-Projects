class Ray {
  Vektor _d; // Rayspitze
  Vektor _o; // Rayursprung
  Ray(Vektor start) {
    _o=start.clone();
    _d=new Vektor(0, 0, 1);
  }

  Vektor direction() {
    return _d.clone();
  }
  Vektor origin() {
    return _o.clone();
  }
  Vektor param(float t) {
    return _o.plusV(_d.multi(t));
  }
}
