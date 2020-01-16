class VisualObject3D extends Receiver{
Vektor3D _loc;
float _step=20;
boolean _filled=false;
float _r =0;
float _diameter=30;

VisualObject3D( Vektor3D loc){
  _loc=loc.clone();
}

void tic(){
  
  _r=_r+0.01;
  
}

void moveLeft(){
  _loc=_loc.addV(new Vektor3D(-_step,0,0));
  println(_loc.getX());
}

void moveRight(){
  _loc=_loc.addV(new Vektor3D(_step,0,0));
  println(_loc.getX());
}

void moveUp(){
  _loc=_loc.addV(new Vektor3D(0,-_step,0));
  println(_loc.getX());
}

void moveDown(){
  _loc=_loc.addV(new Vektor3D(0,_step,0));
  println(_loc.getX());
}
boolean filled(){
  if(_filled){
    return true;
  }else return false;

}
void fillMe(){
  _filled=true;
}
void unFillMe(){
  _filled=false;
}

void enlarge(){
 _diameter=_diameter+5; 
}


void render(PGraphics bitmap3D){

  if(_filled){
    bitmap3D.fill(250,213,0);
  }
  else bitmap3D.noFill();
  bitmap3D.pushMatrix();
  bitmap3D.translate(_loc.getX(),_loc.getY(),_loc.getZ());
  bitmap3D.rotateY(_r);
  bitmap3D.stroke(255,0,0,255);
  bitmap3D.sphereDetail(7);
  bitmap3D.sphere(_diameter);
  bitmap3D.popMatrix();
}


}