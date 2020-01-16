class Ballfab {

  ArrayList<Ball> _balls; // jb20180515 instanzname umbenannt in Plural, die ArrayList repräsentiert mehrere Bälle
  int _bcount=0;
  int _died=0;

  Ballfab() {
    _balls = new ArrayList<Ball>();
  }


  // Bälle werden bewegt und gerendert, bei Verlassen gelöscht, und die gelöschten gezählt....nach 3 Leben ist Exit  
  void init() {

    for (int i=0; i<_balls.size(); i++) {
      _balls.get(i).move();            
      _balls.get(i).render();             

      if (_balls.get(i).kill()==true) {  
        _balls.remove(i);           
        _died++;
        gtextbook.setTime(70);         //Tic-Zahl für das Spruchbuch wird gesetzt jb20180515 redundanter Kommentar
        if (_died>=3)
          exit();
      }
    }
  }
  
  
  //hinzufügen der Bälle, jedoch max. 3
  void plusBall(Balken bar) // jb20180515 Abhängigkeit von Balken deutlich gemacht
  {
    int radius = 15;
    if (_bcount<=2){
      _balls.add(new Ball(gbar.ausgabex()+gbar.ausgabebreite()/2, gbar.ausgabey() -radius, radius,bar));
      _bcount++;
    }
  }
}