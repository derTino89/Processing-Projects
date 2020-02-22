class IPoli3D {
  Vektor3D _point1;
  Vektor3D _point2;
  Vektor3D _runner;
  float _tik=0;
  float _tikrate=0.01;

  IPoli3D(float startTik) {
    _tik=startTik;
  }

  void setPoint1(Vektor3D p1) {
    _point1=p1.clone();
  }
  void setPoint2(Vektor3D p2) {
    _point2=p2.clone();
  }

  void tikLoop() {
    if (_tik+_tikrate<=0.0 || _tik+_tikrate >=1.0) {
      _tikrate=-_tikrate;
    }
    tik();
  }

  void tik() {
    if (_tik<=1.0) {
      _tik=_tik+_tikrate;
      _runner=new Vektor3D(_point2.multZahl(_tik).plusV(_point1.multZahl(1-_tik)));
    }
  }

  boolean Hit() {
    if (_tik<1) {
      return false;
    } else {
      _tik=0;
      return true;
    }
  }

  void renderPoints() {
    if (_point2!=null) {
      pushMatrix();
      fill(240,100,90);
      translate(_point1.getX(), _point1.getY(), _point1.getZ());
      sphereDetail(8);
      sphere(12);
      popMatrix();
      pushMatrix();
      translate(_point2.getX(), _point2.getY(), _point2.getZ());
      sphere(12);
      noFill();
      popMatrix();
    }
  }
  void renderRunner() {
    pushMatrix();
    translate(_runner.getX(), _runner.getY(), _runner.getZ());
    stroke(240,240,180);
    //fill(255, 165, 0,150);
    sphere(8);
    //noFill();
    popMatrix();
  }
  void render() {
    renderPoints();
    renderRunner();
  }
  Vektor3D getRunner() {
    return _runner.clone();
  }
}
