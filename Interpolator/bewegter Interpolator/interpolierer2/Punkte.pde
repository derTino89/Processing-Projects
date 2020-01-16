class Punkte{
float _x;
float _y;
Vektor2D pointOrt;
MovableVektor2D point;

 Punkte(float x, float y){
  _x=x;
  _y=y;
  pointOrt = new Vektor2D(_x,_y);
  point = new MovableVektor2D(pointOrt);
 }
  
 void tic(){
  point.tic(); 
 }
  
 void render(){
  //ellipse(pointOrt.getX(),pointOrt.getY(),20,20); 
  ellipse(point.x(),point.y(),20,20);
 }

 Vektor2D ausgabe(){
   return pointOrt;
 }
}