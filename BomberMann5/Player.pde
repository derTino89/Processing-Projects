class Player extends Listener {
  Vektor2D _loc;
  Vektor2D _startLoc;
  ExplosiveFactory _Bombs;
  Box2D _hitbox;
  UI _map;
  ArrayList<Box2D> _walls;
  float _colr;
  float _colg;
  float _colb;
  String _playerDirection;
  boolean _noWallTopOrLeft;
  boolean _noWallBottomOrRight;
  boolean _movePermission;
  boolean _die;

  Player(UI map, ExplosiveFactory Bombs, Vektor2D loc) {
    _map=map;
    _loc = loc.clone();
    _startLoc=loc.clone();
    _hitbox = new Box2D(new Vektor2D(_loc.getX()-35, _loc.getY()-35), new Vektor2D(70, 120));
    _Bombs = Bombs;
    _colr=random(70, 240);
    _colg=random(70, 240);
    _colb=random(70, 240);
  }
  void setToStart(){
    _loc=_startLoc;
  }

  void tic() {
    _movepermission();
    _move();
    _plant();
    _hitbox.tic(new Vektor2D(_loc.getX()-35, _loc.getY()-35));
  }

  void _movepermission() {
    _walls=_map.getWalls();
    for(int i=0;i<_walls.size();i++){
      if(_walls.get(i).hasInside(_hitbox)){
                    print("2");
        _movePermission=false;
        return;
      }else _movePermission=true;
    }

  }
  boolean permissionTopLeft() {
    return _noWallTopOrLeft;
  }
  boolean permissionBottomRight() {
    return _noWallBottomOrRight;
  }
  boolean movePermission(){
    return _movePermission;
  }


  void render(PGraphics bitmap2D) {
    _liveOrDie();
    if (_die==false) {
      _renderModel();
    }
  }
  void _liveOrDie() {
    for (int i = 0; i<_Bombs.currentBombs().size(); i++) {
      if (_Bombs.currentBombs().get(i).hasInside(_loc)) {
        _die=true;
        return;
      } else _die=false;
    }
  }
  void setDieState(Boolean died){
    _die=died;
  }

  void _plant() {
    gControlP2.plant(_Bombs);
    gControlP1.plant(_Bombs);
  }

  void _move() {
    gControlP2.move();
    gControlP1.move();
  }
  Vektor2D getLoc() {
    return _loc.clone();
  }
  void setLoc(Vektor2D newLoc) {
    _loc=newLoc;
  }

  void SetPlayerView(String direction) {
    _playerDirection=direction;
  }

  String CurrentDirection() {
    return _playerDirection;
  }
  Box2D getHitbox(){
   return _hitbox; 
  }

  void winner() {
    textSize(80);
    text("WINNER",width/2-150,height-180);
    _loc=new Vektor2D(width/2, height/2);
    _playerDirection="center";
    
  }


  void _renderModel() {

    if (_playerDirection=="left") {
      bitmap2D.stroke(220, 220, 120);
      bitmap2D.fill(_colr, _colg, _colb);
      bitmap2D.triangle(_loc.getX(), _loc.getY()-20, _loc.getX()-25, _loc.getY()+75, _loc.getX()+25, _loc.getY()+75);
      bitmap2D.ellipse(_loc.getX(), _loc.getY(), 50, 50);
      bitmap2D.stroke(255);
      bitmap2D.fill(0);
      bitmap2D.ellipse(_loc.getX()-10, _loc.getY()-5, 12, 12);
      bitmap2D.stroke(0);
      bitmap2D.line(_loc.getX()-15, _loc.getY()+10, _loc.getX()-5, _loc.getY()+10);
      bitmap2D.noStroke();
      bitmap2D.noFill();
    } else if (_playerDirection=="right") {
      bitmap2D.stroke(220, 220, 120);
      bitmap2D.fill(_colr, _colg, _colb);
      bitmap2D.triangle(_loc.getX(), _loc.getY()-20, _loc.getX()-25, _loc.getY()+75, _loc.getX()+25, _loc.getY()+75);
      bitmap2D.ellipse(_loc.getX(), _loc.getY(), 50, 50);
      bitmap2D.stroke(255);
      bitmap2D.fill(0);
      bitmap2D.ellipse(_loc.getX()+10, _loc.getY()-5, 12, 12);
      bitmap2D.stroke(0);
      bitmap2D.line(_loc.getX()+5, _loc.getY()+10, _loc.getX()+15, _loc.getY()+10);
      bitmap2D.noStroke();
      bitmap2D.noFill();
    } else {
      bitmap2D.stroke(220, 220, 120);
      bitmap2D.fill(_colr, _colg, _colb);
      bitmap2D.triangle(_loc.getX(), _loc.getY()-20, _loc.getX()-25, _loc.getY()+75, _loc.getX()+25, _loc.getY()+75);
      bitmap2D.ellipse(_loc.getX(), _loc.getY(), 50, 50);
      bitmap2D.stroke(255);
      bitmap2D.fill(0);
      bitmap2D.ellipse(_loc.getX()-10, _loc.getY()-5, 12, 12);
      bitmap2D.ellipse(_loc.getX()+10, _loc.getY()-5, 12, 12);
      bitmap2D.stroke(0);
      bitmap2D.line(_loc.getX()-5, _loc.getY()+10, _loc.getX()+5, _loc.getY()+10);
      bitmap2D.noStroke();
      bitmap2D.noFill();
    }
  }
}