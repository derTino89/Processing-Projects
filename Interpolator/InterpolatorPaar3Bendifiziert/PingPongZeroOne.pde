class PingPongZeroOne
{
  float _t = 0;            // Laufvariable // jb20180528 Das könnte eine Klasse sein, die t kapselt und bei tic zwischen 0 und 1 hin- und herläuft
  float _deltaT = 0.01;  // jb20180528 umbenannt

  void tic()
  {
    float newValue=_t+_deltaT;
    if (newValue>1.0)
      _deltaT=-_deltaT;
    else if (newValue<0.0)
      _deltaT=-_deltaT;
    
    _t+=_deltaT;
  }
  
  float value()
  {
    return _t;
  }
}