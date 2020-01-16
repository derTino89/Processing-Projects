class ExplosiveFactory extends Listener {
  ArrayList<Explosive> _Bombs;
  Boolean _thereIsNoBombHere;

  ExplosiveFactory() {
    super();
    _Bombs=new ArrayList<Explosive>();
  }

  void addExplosive(Explosive newBomb) {
    if (_Bombs.size()<=1) {
      _Bombs.add(newBomb);
    } else {
      _checkForPlace(newBomb);
      if (_thereIsNoBombHere==true) {
        _Bombs.add(newBomb);
        println("Another One!");
      }
    }
  }

  void _checkForPlace(Explosive newBomb) {
    for (int i=0; i<_Bombs.size(); i++) {
      if (_Bombs.get(i).hasInside(newBomb.getLoc())) {          
        _thereIsNoBombHere=false;
        return;
      }else _thereIsNoBombHere=true;
    }
  }
  ArrayList<Explosive> currentBombs(){
     return _Bombs; 
  }

  void render(PGraphics bitmap3D) {
    for (int i = 0; i<_Bombs.size(); i++) {
      _Bombs.get(i).render(bitmap3D);
    }
  }
  void tic() {
    for (int i = 0; i<_Bombs.size(); i++) {
      _Bombs.get(i).tic();
      if(_Bombs.get(i).currentLifetime()<=0){
        _Bombs.remove(i);
      }
    }
  }
}