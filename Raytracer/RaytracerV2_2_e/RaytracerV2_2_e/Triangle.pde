class Triangle {
  Vektor _a;

  Vektor _ab;
  Vektor _ac;



  Matrix3D _triangle;

  //Faktoren:
  float _gamma;
  float _beta;
  float _t;

  Triangle(Vektor a, Vektor b, Vektor c) {
    _a=a.clone();

    _ab=_a.minusV(b);
    _ac=_a.minusV(c);
  }
  Hit calculateHit(Ray ray) {
    _cramer(ray);
    if (_gamma<=1 && _gamma>=0 &&_beta<=1 && _beta>=0) {
      return new Hit(_hitPoint(), _surfaceNormV(), true, _t);
    } else {
      return new Hit();
    }
  }
  Vektor _surfaceNormV(){
    return _ab.kreuz(_ac).normV();
  }
  Vektor _hitPoint(){
    return new Vektor(_gamma,_beta,_t);
  }

  void _cramer(Ray ray) { 
    Vektor _rayO=ray.origin();
    Vektor _rayD=ray.direction();
    Vektor ao=_a.minusV(_rayO);//Dreickpunkt a minus Sehstrahl-origin
    _triangle=new Matrix3D(_ab, _ac, _rayD);
    Matrix3D pGamma = new Matrix3D(ao, _ac, _rayD);
    Matrix3D pBeta = new Matrix3D(_ab, ao, _rayD);
    Matrix3D pt= new Matrix3D(_ab, _ac, ao);
    _gamma=pGamma.det()/_triangle.det();
    _beta=pBeta.det()/_triangle.det();
    _t=pt.det()/_triangle.det();
  }
}