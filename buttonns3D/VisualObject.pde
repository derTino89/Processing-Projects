class VisualObject extends Receiver{
Vektor2D _loc;
float _step=20;
boolean _filled=false;

VisualObject( Vektor2D loc){
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
  ellipse(_loc.getX(),_loc.getY(),50,50);

}


}
