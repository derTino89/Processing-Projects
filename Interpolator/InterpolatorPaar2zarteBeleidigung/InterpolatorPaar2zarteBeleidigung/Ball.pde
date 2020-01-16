class Ball{
float _x;
float _y;
Vektor2D _ort;

 Ball(float x,float y){
   _x=x;
   _y=y;
   _ort=new Vektor2D(_x,_y);
 }
 
 void render(){
   ellipse(_x,_y,20,20);
 }
 
 Vektor2D ort(){
   return _ort.clone();
 }
 
}



//nicht benötigt:
//Ball(Vektor2D ort){
 //  _ort=new Vektor2D(ort.getX(),ort.getY());
 //}