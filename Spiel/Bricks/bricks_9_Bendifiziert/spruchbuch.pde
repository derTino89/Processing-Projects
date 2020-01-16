class Spruchbuch {
  float _counticount;

  Spruchbuch(int zeit) {
    _counticount = zeit;
  }

  void tic() {
    _counticount--;
  }

  void setTime(int time) {
    _counticount = time;
  }

  // jb20180515 unbenutzte methode
  //void _gameover() {
  //  if (_counticount>0) {
  //    textAlign(CENTER);
  //    textSize(172);
  //    fill(25, 20, 150);
  //    text("GAME OVER", width/2, height/2);
  //  }
  //}

  void _renderLeertaste() {
    textAlign(CENTER); 
    textSize(20); 
    fill(200);
    text("Press Space for Ball", width/2, height-10);
  }

  void _renderSpielEnde()
  {
    textAlign(CENTER);
    textSize(172);
    fill(255, 0, 150);
    text("Versager!", width/2, height/2);
  }

  // jb20180515 methode neutraler benannt
  void render() 
  {
    _renderLeertaste(); // 20180515 als private Methode hier eingemeindet. Vermeidet Fehlbedienungsmöglichkeit
    if (_counticount>0) 
      _renderSpielEnde();
  }
}