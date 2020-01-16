class HoppingBall
{
  Vektor2D _locB;
  float _vx;
  float _vy;
  float _r;

  Tracer _t;

  HoppingBall(float x, float y)
  {
    _locB=new Vektor2D(x, y);
    _r=20;
    _vy=0;
    _vx=random(-25, 25);
    _t=new Tracer();
  }

  void move()
  {
    _locB.addiereX(_vx);
    _locB.addiereY(_vy);

    if ((_locB.getY()+_r)>=height)
    {
      _vy=-_vy;//*.95;
      _vx*=.99;
    } else
      _vy++;

    if (_locB.getX()+_r>=width)
      _vx=-_vx;
    if (_locB.getX()-_r<0)
      _vx=-_vx;



    _t.trace(_locB);
  }

  void render()
  {
    ellipse(_locB.getX(), _locB.getY(), _r, _r);
    _t.render();
  }
}