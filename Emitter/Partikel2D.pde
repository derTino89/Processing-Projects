class Rechteck extends Partikel2D{
  Rechteck(float x, float y){
   super(x,y);
  }
  void render(){
   rect(_loc.getX(),_loc.getY(),40,40); 
  }
  
}

class Partikel2D{
 Vektor2D _loc;
 Vektor2D _speed;
  
  Partikel2D(float x, float y){
    _loc=new Vektor2D(x,y);
    _speed=new Vektor2D(random(-5,5),random(-5,5));
  }
  
  void tic(){
   _loc=_loc.add(_speed); 
  }
  
  void render(){
   ellipse(_loc.getX(),_loc.getY(),20,20); 
  }
  
}