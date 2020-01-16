class Camera {
  //Derzeit einfacher zum Rechnen mit Einzelwerten:
  float _camX=200;
  float _camY=-120;
  float _camZ=600;
  float _targetX=200; 
  float _targetY=0;
  float _targetZ=0;

  //eventuell für komplexere Methoden:
  Vektor3D _camLoc=new Vektor3D(_camX, _camY, _camZ);
  Vektor3D _targetLoc=new Vektor3D(_targetX, _targetY, _targetZ);

  void tic() {
    _watchKeys();
    camera(_camX, _camY, _camZ, _targetX, _targetY, _targetZ, 0, 1, 0);
  }

//Ich habe die Tastatureingaben von den Bewegungsmethoden extrahiert, Ihren Tip mit dem CameraRig verstehe ich noch nicht ganz,
//vielleicht nach ein paar weiteren Programmen

  void _watchKeys() {
    if (keyPressed) {
      if (keyCode==LEFT) {
        _moveCamH(-10);
      }
      if (keyCode==RIGHT) {
        _moveCamH(10);
      }
      if (keyCode==UP) {
        _swingCamH(-10);
      }
      if (keyCode==DOWN) {
        _swingCamH(10);
      }
    }
  }

  void _moveCamH(float step) {
    _camX=_camX+step;
    _targetX=_targetX+step;
  }

  void _swingCamH(float step) {      //umbenannt
        _targetX=_targetX+step;
  }

  void moveDepth(float wheelstep) {  //umbenannt
    _camZ=_camZ+wheelstep*30;
    _targetZ=_targetZ+wheelstep*30;
  }
}
