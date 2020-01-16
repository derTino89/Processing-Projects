class VisualObject3D extends Receiver{
Vektor3D _loc;
float _step=20;
boolean _filled=false;
float _r =0;

VisualObject3D( Vektor3D loc){
  _loc=loc.clone();
  print("ruru");
}

void tic(){
  
  _r++;
  
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


void render(){
  if(_filled){
    fill(250);
  }
  else noFill();
  pushMatrix();
  
  translate(_loc.getX(),_loc.getY(),_loc.getZ());
  rotateY(_r);
  sphereDetail(5);
  sphere(40);
  popMatrix();
}


}
