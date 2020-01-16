class Buttonstate {
  int _currentState;
  int _newState;

  //0 = Mouse draußen
  //1 = Mouse drinnen
  //2 = mouse drinnen gedrückt
  //3 = mouse drinnen losgelassen = Auslöser Execute

  Buttonstate(int state) {
    _currentState=state;
  }

  void setTo(int newState) {
    _newState = newState; 
    _darfErDas();
  }

  void _darfErDas() {
    if (_currentState==3)
      _currentState=0;
    if (_newState==0)
      _currentState=_newState;
    if (_currentState==0 && _newState==1)
      _currentState=_newState;
    if (_currentState==1 && _newState==2)
      _currentState=_newState;
    if (_currentState==2 && _newState==3)
      _currentState=_newState;
  }
  int currentState() {
    //println(_currentState);
    return _currentState;
  }
}