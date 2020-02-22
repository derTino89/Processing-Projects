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

  void gameover() {
    if (_counticount>0) {
      textAlign(CENTER);
      textSize(172);
      fill(25, 20, 150);
      text("GAME OVER", width/2, height/2);
    }
  }

  void leertaste() {
    textAlign(CENTER); 
    textSize(20); 
    fill(200);
    text("Press Space for Ball", width/2, height-10);
  }


  void versager() {

    if (_counticount>0) {
      textAlign(CENTER);
      textSize(172);
      fill(255, 0, 150);
      text("Versager!", width/2, height/2);
    }
  }
}