class ButtonFactory {
  
TicRenderClock _clock;
Mouse _mouse;
Vektor2D _pos = new Vektor2D(20,40);
Vektor2D _dim = new Vektor2D(150,50);


ButtonFactory(TicRenderClock clock, Mouse mouse){
  _clock=clock;
  _mouse=mouse;
}

void addButton(String label, Command knopfdruck){
  Button NEWButton = new Button(label, _pos, _dim, _mouse, knopfdruck);
  _pos=_pos.addV(new Vektor2D(0,_dim.getY()+10));
  _clock.subscribe(NEWButton);
}

void addButton3D(String label, Command3D knopfdruck){
  Button NEWButton = new Button(label, _pos, _dim, _mouse, knopfdruck);
  _pos=_pos.addV(new Vektor2D(0,_dim.getY()+10));
  _clock.subscribe(NEWButton);
}






}
