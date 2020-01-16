class Explosive extends Listener {
  Vektor3D _loc;
  float _r =0;
  float _diameter=30;
  float _lifetime=200;
  float _seconds;


  Explosive( Vektor3D loc) {
    _loc=loc.clone();
  }

  void tic() {  
    _r=_r+0.05;
    _lifetime--;
    _seconds=(_lifetime/30)-1;
    if(_seconds<=0 && _diameter<=100){
     _diameter=_diameter+5; 
    }
  }

  float currentLifetime() {
    return _lifetime;
  }

  boolean hasInside(Vektor2D here) {
    if (here.subV(new Vektor2D(_loc.getX(), _loc.getY())).lenght()<=2*_diameter) {
      return true;
    } else return false;
  }

  Vektor2D getLoc() {
    return new Vektor2D(_loc.getX(), _loc.getY());
  }

  void render(PGraphics bitmap3D) {
 
    bitmap3D.pushMatrix();
    bitmap3D.translate(_loc.getX(), _loc.getY(), _loc.getZ());
    bitmap3D.fill(255);
    bitmap3D.textSize(40);
    bitmap3D.text(round(_seconds+1), -12,+15, _loc.getZ());
    bitmap3D.rotateY(_r);
    bitmap3D.stroke(255, 0, 0, 255);
    bitmap3D.sphereDetail(7);
    bitmap3D.fill(35,35,35,35);
    bitmap3D.sphere(_diameter);
    bitmap3D.popMatrix();
  }
}