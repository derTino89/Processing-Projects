class Ballfab {

  ArrayList<Balls> _ball;
  int _bcount=0;
  int _died=0;

  Ballfab() {
    _ball = new ArrayList<Balls>();
  }


  // Bälle werden bewegt und gerendert, bei Verlassen gelöscht, und die gelöschten gezählt....nach 3 Leben ist Exit  
  void init() {

    for (int i=0; i<_ball.size(); i++) {
      _ball.get(i).move();            
      _ball.get(i).render();             

      if (_ball.get(i).kill()==true) {  
        _ball.remove(i);           
        _died++;
        gtextbook.setTime(70);         //Tic-Zahl für das Spruchbuch wird gesetzt
        if (_died>=3)
          exit();
      }
    }
  }
  
  
  //hinzufügen der Bälle, jedoch max. 3
  void plusBall() {
    int radius = 15;
    if (_bcount<=2){
      _ball.add(new Balls(gbar.ausgabex()+gbar.ausgabebreite()/2, gbar.ausgabey() -radius, radius));
      _bcount++;
    }
  }
}