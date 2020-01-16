class PlayerControl {  

  void move() {
    print("die move muss überschrieben werden");
  }
}

class ArrowControl extends PlayerControl {
  Player _spieler2;
  UI _map;
  ArrayList<Box2D> _walls;
  boolean _movePermissionUP =true;
  boolean _movePermissionDOWN=true;
  boolean _movePermissionLEFT=true ;
  boolean _movePermissionRIGHT=true;

  ArrowControl(Player spieler2, UI map) {
    _spieler2=spieler2;
    _map=map;
    _walls=_map.getWalls();
  }

  void move() {

    if (keyPressed) {
      if (key==CODED) {


        if (keyCode==UP) {        
          for (int i=0; i<_walls.size(); i++) {
            if (_walls.get(i).hasInside(_spieler2.getHitbox())) {
              print("2");
              _movePermissionUP=false;
              _spieler2.setLoc(_spieler2.getLoc().addV(new Vektor2D(0, +5)));
              _movePermissionDOWN=true;
              return;
            } else _movePermissionUP=true;
          }
          if (_movePermissionUP==false) {
            return;
          } else _spieler2.setLoc(_spieler2.getLoc().addV(new Vektor2D(0, -5)));
        }

        if (keyCode==DOWN) {
          for (int i=0; i<_walls.size(); i++) {
            if (_walls.get(i).hasInside(_spieler2.getHitbox())) {
              print("2gdfgdfgdf");
              _movePermissionDOWN=false;
              return;
            } else _movePermissionDOWN=true;
          }
          if (_movePermissionDOWN==false) {
            return;
          } else {
            _spieler2.setLoc(_spieler2.getLoc().addV(new Vektor2D(0, 5)));
          }
        }
        if (keyCode==LEFT) {
          if (_spieler2.movePermission()==false) {
            return;
          } else {
            _spieler2.setLoc(_spieler2.getLoc().addV(new Vektor2D(-5, 0)));
            _spieler2.SetPlayerView("left");
          }
        }
        if (keyCode==RIGHT) {
          if (_spieler2.movePermission()==false) {
            return;
          } else {
            _spieler2.setLoc(_spieler2.getLoc().addV(new Vektor2D(5, 0)));
            _spieler2.SetPlayerView("right");
          }
        }
      }
    }
  }
  void plant(ExplosiveFactory bombs) {
    if (key=='0') {
      if (_spieler2.CurrentDirection()=="right") {
        Vektor3D newBombLoc = new Vektor3D(_spieler2.getLoc().getX()+80, _spieler2.getLoc().getY()+45, 0);
        bombs.addExplosive(new Explosive(newBombLoc));
      }
      if (_spieler2.CurrentDirection()=="left") {
        Vektor3D newBombLoc = new Vektor3D(_spieler2.getLoc().getX()-80, _spieler2.getLoc().getY()+45, 0);
        bombs.addExplosive(new Explosive(newBombLoc));
      }
    } else return;
  }
}


class WASDControl extends PlayerControl {
  Player _spieler1;

  WASDControl(Player spieler1) {
    _spieler1=spieler1;
  }

  void move() {
    if (keyPressed) {
      if (key=='w') {
        if (_spieler1.permissionTopLeft()==false) {
          return;
        } else _spieler1.setLoc(_spieler1.getLoc().addV(new Vektor2D(0, -5)));
      }
      if (key=='s') {
        if (_spieler1.permissionBottomRight()==false) {
          return;
        } else _spieler1.setLoc(_spieler1.getLoc().addV(new Vektor2D(0, 5)));
      }
      if (key=='a') {
        if (_spieler1.permissionTopLeft()==false) {
          return;
        } else {
          _spieler1.setLoc(_spieler1.getLoc().addV(new Vektor2D(-5, 0)));
          _spieler1.SetPlayerView("left");
        }
      }
      if (key=='d') {
        if (_spieler1.permissionBottomRight()==false) {
          return;
        } else {
          _spieler1.setLoc(_spieler1.getLoc().addV(new Vektor2D(5, 0)));
          _spieler1.SetPlayerView("right");
        }
      }
    }
  }
  void plant(ExplosiveFactory bombs) {
    if (key==' ') {
      if (_spieler1.CurrentDirection()=="right") {
        Vektor3D newBombLoc = new Vektor3D(_spieler1.getLoc().getX()+80, _spieler1.getLoc().getY()+45, 0);
        bombs.addExplosive(new Explosive(newBombLoc));
      } 
      if (_spieler1.CurrentDirection()=="left") {
        Vektor3D newBombLoc = new Vektor3D(_spieler1.getLoc().getX()-80, _spieler1.getLoc().getY()+45, 0);
        bombs.addExplosive(new Explosive(newBombLoc));
      }
    } else return;
  }
}