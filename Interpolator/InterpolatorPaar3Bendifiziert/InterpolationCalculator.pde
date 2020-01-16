

class InterpolationCalculator {
  Vektor2D _punkt1;
  Vektor2D _punkt2;
  Vektor2D _runner;        // Interpolierter Vektor // jb2080528 guter Name
  PingPongZeroOne _t;
  //boolean _hit;            // Grenze der Laufvariable // jb20180528 abgeschafft


  InterpolationCalculator()
  {
    _t=new PingPongZeroOne();
  }
  
  
  boolean isEmpty()
  {
    return !_hasPoint1();
  }

  boolean isFull()
  {
    return _hasTwoPoints();
  }


  void add(Vektor2D p)
  {
    if (isEmpty())
      _addPoint1(p);
    else if (!isFull())
      _addPoint2(p);
    else
    {
      error.put("InterpolationCalculator.add(): Objekt ist voll! Dennoch ruft der Using-Code add(Vektor)!");
    }
  }

  // jb20180528 privatisiert
  void _addPoint1(Vektor2D punkt1) 
  {
    _punkt1=punkt1.clone();
  }

  void _addPoint2(Vektor2D punkt2) 
  {
    _punkt2=punkt2.clone();
  }


  void tic()
  {
    _ticloop();
  }

  // jb20180528 privatisiert
  void _ticloop() 
  {
    if (!_hasTwoPoints()) 
      return;
    _t.tic();
    float tValue=_t.value();
    _runner=new Vektor2D(_punkt1.malZahl(tValue).plus(_punkt2.malZahl(1-tValue)));
  }

  void renderRunner() {
    ellipse(_runner.getX(), _runner.getY(), 10, 10);
  }

  // jb20180528 neu! neu! neu!
  void render()
  {
    if (_hasPoint1()) 
      _renderPoint1();

    if (_hasTwoPoints()) 
    {
      _renderPoint2();
      renderRunner();
    }
  }

  // jb20180528 privatisiert
  void _renderPoint1() {
    ellipse(_punkt1.getX(), _punkt1.getY(), 30, 30);
  }
  // jb20180528 privatisiert
  void _renderPoint2() {
    ellipse(_punkt2.getX(), _punkt2.getY(), 30, 30);
  }


  // jb20180528 privatisiert
  boolean _hasTwoPoints() {
    if (_punkt1==null) {
      return false;
    }
    if (_punkt2==null) {
      return false;
    }
    return true;
  }

  boolean _hasPoint1() 
  {
    return _punkt1!=null;
  }
}