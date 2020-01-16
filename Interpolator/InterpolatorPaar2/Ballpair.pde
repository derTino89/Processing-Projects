class Ballpair {
  Ball _ball1;
  Ball _ball2;
  Interpol _inter; 

  Ballpair(Ball ball1, Ball ball2) {
    _ball1 = ball1;
    _ball2 = ball2;
    _inter = new Interpol(_ball1.ort(), _ball2.ort());
  }

  void interpolTicLoop() {
    _inter.ticloop();
  } 

  void interpolTicLoopRender() {
    _inter.render();
  }
}