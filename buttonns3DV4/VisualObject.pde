class VisualObject2D extends Receiver{
Vektor2D _loc;
float _step=20;
float _r=60;
boolean _filled=false;


VisualObject2D( Vektor2D loc){
  _loc=loc.clone();

}

void tic(){
  
  
}

void moveLeft(){
  _loc=_loc.addV(new Vektor2D(-_step,0));
  println(_loc.getX());
}

void moveRight(){
  _loc=_loc.addV(new Vektor2D(_step,0));
  println(_loc.getX());
}

void moveUp(){
  _loc=_loc.addV(new Vektor2D(0,-_step));
  println(_loc.getX());
}

void moveDown(){
  _loc=_loc.addV(new Vektor2D(0,_step));
  println(_loc.getX());
}

void enlarge(){
  _r=_r+10;
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


void render(PGraphics bitmap2D){
  bitmap2D.stroke(255,0,0);
  bitmap2D.strokeWeight(5);
  if(_filled){
    bitmap2D.fill(250,213,0);
  }
  else bitmap2D.noFill();
  
  bitmap2D.ellipse(_loc.getX(),_loc.getY(),_r,_r);
  bitmap2D.strokeWeight(1);
  bitmap2D.stroke(255);
}

  
}