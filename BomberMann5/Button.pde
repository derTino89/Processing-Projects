class Button extends Listener {
  Mouse _mouse;
  Buttonstate _buttonstate;
  Vektor2D _pos;
  Vektor2D _dim;
  String _label;
  Command _knoppke;

  boolean _tab;
  boolean _3D;

  Button(String label, Vektor2D pos, Vektor2D dim, Mouse mouse, Command knopple, boolean tab) {
    _tab=tab;
    _mouse=mouse;
    _buttonstate=new Buttonstate(0);
    _label=label;
    _pos=pos.clone();
    _dim=dim.clone();
    _knoppke=knopple;
    _3D=false;
  }
  Button(String label, Vektor2D pos, Vektor2D dim, Mouse mouse) {
    _mouse=mouse;
    _buttonstate=new Buttonstate(0);
    _label=label;
    _pos=pos.clone();
    _dim=dim.clone();

  }

  void _mouseOverButton() {
    if (mouseX>=_pos.getX() && mouseX<=_pos.getX()+_dim.getX()) {
      if (mouseY>=_pos.getY() && mouseY<=_pos.getY()+_dim.getY()) {
        _buttonstate.setTo(1);
      } else {
        _buttonstate.setTo(0);
      }
    } else {
      _buttonstate.setTo(0);
    }
  }

  void _mouseDown() {
    if (_mouse.mouseDown()) {
      _buttonstate.setTo(2);
    }
  }
  void _mouseUp() {
    if (!_mouse.mouseDown()) {
      _buttonstate.setTo(3);
    }
  }


  void tic() {
    _mouseOverButton();
    _mouseDown();
    _mouseUp();
    if (_buttonstate.currentState()==3) {
      if (!_3D) {
        _knoppke.execute();
      } 
    }
  }

  void _checkStateForRender(PGraphics bitmap2D) {

    bitmap2D.fill(50);
    if (_buttonstate.currentState()==1) {
      bitmap2D.fill(50, 200, 80);
    }
    if (_buttonstate.currentState()==2) {
      bitmap2D.fill(150, 150, 20);
    }
  }

  void render(PGraphics bitmap2D) {
    if (!_tab) {
      _checkStateForRender(bitmap2D);
      bitmap2D.stroke(255); 
      bitmap2D.rect(_pos.getX(), _pos.getY(), _dim.getX(), _dim.getY());
      bitmap2D.fill(255);
      bitmap2D.textSize(20);
      bitmap2D.text(_label, _pos.getX()+50, _pos.getY()+50);
      bitmap2D.noFill();
    }else{
      _checkStateForRender(bitmap2D);
      bitmap2D.stroke(50,0,0); 
      bitmap2D.rect(_pos.getX(), _pos.getY(), _dim.getX(), _dim.getY());
      bitmap2D.fill(255, 0, 0);
      bitmap2D.textSize(20);
      bitmap2D.text(_label, _pos.getX()+50, _pos.getY()+50);
      bitmap2D.noFill();
      
      
    }
  }
}