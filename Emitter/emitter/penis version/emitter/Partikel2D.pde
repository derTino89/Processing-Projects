class Rechteck extends Partikel2D{
  Rechteck(float x, float y){
   super(x,y);
  }
  void graficExe(){   
    rect(_loc.getX(),_loc.getY(),10,10);  
  }
  void render(){
    fill(255,255,255); 
    graficExe();
     noFill();
  }  
}
class HellblauesMinusZeichen extends Rechteck{
    HellblauesMinusZeichen(float x, float y){
      super(x,y);
    }
    void render(){
    fill(0,153,255);
    rect(_loc.getX(),_loc.getY(),20,5);
    noFill();
    }
}
class Geraet extends Partikel2D{
  Geraet(float x, float y){
    super(x,y);
  }
  void graficExe(){
    fill(203,156,111);
    rect(_loc.getX(),_loc.getY(),40,10);
    ellipse(_loc.getX(),_loc.getY()+5,15,13);
    ellipse(_loc.getX()+40,_loc.getY()+10,12,15);
    ellipse(_loc.getX()+36,_loc.getY()+10,12,17);
    noFill();
  }
  
 void render(){
   graficExe();
 }
}

class RotesRechteck extends Rechteck{
 RotesRechteck(float x, float y){
  super(x,y); 
 }
 void render(){
  stroke(255,0,0);
  fill(255,50,50);
  graficExe();
  noFill();
  stroke(255,255,255);
 }
}


class Triangle extends Partikel2D{
 Triangle(float x, float y){
  super(x,y); 
 }
 
 void render(){
   fill(50,200,50);
   triangle(_loc.getX(),_loc.getY(),_loc.getX()+20,_loc.getY(),_loc.getX(),_loc.getY()+20);
   noFill();
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
    fill(255,200,10);
    ellipse(_loc.getX(),_loc.getY(),10,10);
    noFill();
  }
  
  
}