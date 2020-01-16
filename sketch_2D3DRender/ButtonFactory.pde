class ButtonFactory {
  
TicRenderClock _clock;
Mouse _mouse;
Vektor2D _pos2D = new Vektor2D(20,150);
Vektor2D _pos3D = new Vektor2D(width-170,150);
Vektor2D _posTab = new Vektor2D(1,1);

Vektor2D _dimTab = new Vektor2D(165,40);
Vektor2D _dim = new Vektor2D(150,50);


ButtonFactory(TicRenderClock clock, Mouse mouse){
  _clock=clock;
  _mouse=mouse;
}

void addButton(String label, Command knopfdruck){
  Button NEWButton = new Button(label, _pos2D, _dim, _mouse, knopfdruck, false);
  _pos2D=_pos2D.addV(new Vektor2D(0,_dim.getY()+10));
  _clock.subscribe2D(NEWButton);
}

//void addButton3D(String label, Command3D knopfdruck){
//  Button NEWButton = new Button(label, _pos3D, _dim, _mouse, knopfdruck);
//  _pos3D=_pos3D.addV(new Vektor2D(0,_dim.getY()+10));
//  _clock.subscribe3D(NEWButton);
//}

void addTab(String label, Command TabClap){
  Button NewButton = new Button(label, _posTab, _dimTab, _mouse, TabClap, true);
  _posTab = _posTab.addV(new Vektor2D(170,0));
  _clock.subscribe2D(NewButton);
  _clock.subscribe3D(NewButton);
}




}
