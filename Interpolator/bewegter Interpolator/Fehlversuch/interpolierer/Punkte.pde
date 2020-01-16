class Punkte{
float _x;
float _y;
Vektor2D pointOrt;

 Punkte(float x, float y){
  _x=x;
  _y=y;
  pointOrt = new Vektor2D(_x,_y);
 }
  
  
  
 void render(){
  ellipse(pointOrt.getX(),pointOrt.getY(),20,20); 
 }

 Vektor2D ausgabe(){
   return pointOrt;
 }
}