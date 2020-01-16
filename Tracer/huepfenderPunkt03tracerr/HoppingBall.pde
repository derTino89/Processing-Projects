class HoppingBall
{
  float _x;
  float _y;
  float _vx;
  float _vy;
  float _r;
  
  Tracer _t;

  HoppingBall(float x, float y)
  {
    _x=x;
    _y=y;
    _r=20;
    _vy=random(-10, 0);
    _vx=random(-25, 25);
    _t=new Tracer(100);
  }

  void move()
  {
    _vy++;
    _y=_y+_vy;
    _x=_x+_vx;
    
    if(_y+_r>height){
      _vy=-_vy-1;
    }
    if(_y-_r<0){
      _vy=-_vy;
    }
    if(_x+_r>width){
      _vx=-_vx;
    }
    if(_x-_r<0){
      _vx=-_vx;
    }
    
    _t.trace(_x,_y);
  }

  void render()
  {
    ellipse(_x, _y, _r, _r);
    _t.render();
  }
}