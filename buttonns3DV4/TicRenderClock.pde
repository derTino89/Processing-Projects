class TicRenderClock {
  ArrayList<Receiver> _Buttons2D;
  ArrayList<Receiver> _Buttons3D;

  TicRenderClock() {
    _Buttons2D=new ArrayList<Receiver>();
    _Buttons3D=new ArrayList<Receiver>();
  }

  void subscribe2D(Receiver listener) {
    _Buttons2D.add(listener);
  }
  void subscribe3D(Receiver listener) {
    _Buttons3D.add(listener);
  }

  void tic() {
    for (int i=0; i<_Buttons2D.size(); i++)
      _Buttons2D.get(i).tic();
    for (int i=0; i<_Buttons3D.size(); i++)
      _Buttons3D.get(i).tic();
  }
  void render2D(PGraphics bitmap) {
    for (int i=0; i<_Buttons2D.size(); i++)
      _Buttons2D.get(i).render(bitmap);
  }

  void render3D(PGraphics bitmap) {
    for (int i=0; i<_Buttons3D.size(); i++)
      _Buttons3D.get(i).render(bitmap);
  }
}