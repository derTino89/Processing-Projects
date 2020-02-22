class Light {
  
  Vektor _loc;
  float _brightness = 300;

  float _red=255;
  float _green=255;
  float _blue=255;

  Light(Vektor loc) {
    _loc=loc;
  }

  Vektor lightVektor(Vektor object)  
  {
    float r =  _loc.minusV(object).lenght()*0.05;
    return _loc.clone().minusV(object).divide(r*r).multi(_brightness);
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
