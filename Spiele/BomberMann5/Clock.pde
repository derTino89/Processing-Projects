class Clock {
  ArrayList<Listener> _listener2D;
  ArrayList<Listener> _listener3D; 


  Clock(){
    _listener2D = new ArrayList<Listener>();
    _listener3D = new ArrayList<Listener>();
  }

  void subscribe2D(Listener newListener) {
    _listener2D.add(newListener);
  }
  void subscribe3D(Listener newListener) {
    _listener3D.add(newListener);
  }

  void tic() {
    for (int i=0; i<_listener2D.size(); i++) {
      _listener2D.get(i).tic();
    }
    for (int i=0; i<_listener3D.size(); i++) {
      _listener3D.get(i).tic();
    }
  }
  void render2D(PGraphics bitmap) {
    for (int i=0; i<_listener2D.size(); i++) {
      _listener2D.get(i).render(bitmap);
    }
  }
  void render3D(PGraphics bitmap) {
    for (int i=0; i<_listener3D.size(); i++) {
      _listener3D.get(i).render(bitmap);
    }
  }
}