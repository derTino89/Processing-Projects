class Triangle extends RenderObject {
  Vektor _a;
  Vektor _ab;
  Vektor _ac;

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
    if (_beta<=1 && _beta>=0) {
      if (_gamma<=1 && _gamma>=0 && _gamma+_beta<=1) {
        return new Hit(_hitPoint(), _surfaceNormV(), true, _t);
      } else return new Hit();
    } else {
      return new Hit();
    }
  }
  Vektor _surfaceNormV() {
    return _ab.kreuz(_ac).normV();
  }
  Vektor _hitPoint() {
    return new Vektor(_gamma, _beta, _t);
  }

  void _cramer(Ray ray) { 
    Vektor ao=_a.minusV(ray.origin());
    
    Matrix3D _triangle=new Matrix3D(_ab, _ac, ray.direction());
    Matrix3D pGamma = new Matrix3D(ao, _ac, ray.direction());
    Matrix3D pBeta = new Matrix3D(_ab, ao, ray.direction());
    Matrix3D pt= new Matrix3D(_ab, _ac, ao);
    
    _gamma = pGamma.det()/_triangle.det();
    _beta = pBeta.det()/_triangle.det();
    _t = pt.det()/_triangle.det();
  }
}
