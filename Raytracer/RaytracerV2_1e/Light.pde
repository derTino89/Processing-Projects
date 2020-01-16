class Light {
  Vektor _loc;

  Light(Vektor loc) {
    _loc=loc;
  }
  
  Vektor getLight() {
    return _loc.clone();
  }
}
