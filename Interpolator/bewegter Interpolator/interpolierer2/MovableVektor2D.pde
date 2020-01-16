class MovableVektor2D{
  Vektor2D here;
  
  MovableVektor2D(Vektor2D input){
    here = input.clone();
  }
  
  MovableVektor2D(MovableVektor2D another){
    here = another.here.clone(); 
  }
  
  MovableVektor2D clone(){
    return new MovableVektor2D(this);
  }
  
  MovableVektor2D multS(float x){
    return new MovableVektor2D(here.malZahl(x));
  }
  
  //MovableVektor2D addiere(MovableVektor2D input){
  //  return new MovableVektor2D(here.addiereMV(input));
  //}
  
  void tic(){
   here=here.plus(new Vektor2D(1,0));
  }
  
  float x()
  {
    return here.getX();
  }
  float y()
  {
    return here.getY();
    
  }
  
}