class Light {
  
  Vektor3D _loc;
  float _brightness = 300;

  float _red=255;
  float _green=255;
  float _blue=255;

  Light(Vektor3D loc) {
    _loc=loc;
  }

  Vektor3D lampDirection(Vektor3D object) {
    return _loc.clone().minusV(object);
  }

  float calculateR(Vektor3D objekt) {
    float r = _loc.minusV(objekt).lenght();
    return _brightness*_red/(r*r);
  }
  float calculateG(Vektor3D objekt) {
    float r = _loc.minusV(objekt).lenght();
    return _brightness*_green/(r*r);
  }
  float calculateB(Vektor3D objekt) {
    float r = _loc.minusV(objekt).lenght();
    return _brightness*_blue/(r*r);
  }

  void setBrightness(float newValue) {
    _brightness=newValue;
  }

  void setColor(float red, float green, float blue) {
    _red=red;
    _green=green;
    _blue=blue;
  }

  Vektor3D getLightLoc() {
    return _loc.clone();
  }
}
