class Light {
  
  Vektor _loc;
  float _brightness = 300;

  float _red=255;
  float _green=255;
  float _blue=255;

  Light(Vektor loc) {
    _loc=loc;
  }

  Vektor lampDirection(Vektor object) {
    return _loc.clone().minusV(object);
  }

  float calculateR(Vektor objekt) {
    float r =  _loc.minusV(objekt).lenght();
    return _brightness*_red/(r*r);
  }
  float calculateG(Vektor objekt) {
    float r = _loc.minusV(objekt).lenght();
    return _brightness*_green/(r*r);
  }
  float calculateB(Vektor objekt) {
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

  Vektor getLightLoc() {
    return _loc.clone();
  }
}