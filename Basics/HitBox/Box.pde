class Box{
 Vektor2D VBoxOrt;
 Vektor2D VBoxGroesse; 
   
 Box(Vektor2D location, Vektor2D size){
     VBoxOrt=location;
     VBoxGroesse=size;
   
 }
  
 void render(){
   rect(VBoxOrt.getX(),VBoxOrt.getY(),VBoxGroesse.getX(),VBoxGroesse.getY());
 }
 
 //prüfen ob eine Koordinate mit zusätzlichem Radius innerhalb der Box ist
 
 boolean isInside(Vektor2D here,float r){
     
     return !isOutside(here,r);
 }
 
 boolean isOutside(Vektor2D here, float r){
     if (isOutsideX(here,r)){
         return true;
     }
     if(isOutsideY(here,r)){
         return true;       
     }
     return false;
 }
 
 boolean isOutsideX(Vektor2D here,float r){
     if(here.getX()+r<=VBoxOrt.getX()){
       return true;
     }
     else if(here.getX()>=VBoxOrt.getX()+VBoxGroesse.getX()){
       return true;       
     } 
   return false;
 }
 
 boolean isOutsideY(Vektor2D here, float r){
     if(here.getY()+r<=VBoxOrt.getY()){
       return true;
     }
     else if(here.getY()>=VBoxOrt.getY()+VBoxGroesse.getY()){
       return true;
     }
   return false;
 }
 
 
 
  //boolean isInside(Vektor2D here, float r){
  //  boolean draussen=false;
  //  float x=here.getX();
  //  float y=here.getY();
  //  if(x>=VBoxOrt.getX()-r && x<=VBoxOrt.getX()+VBoxGroesse.getX()){
  //    if(y+r>=VBoxOrt.getY() && y<=VBoxOrt.getY()+VBoxGroesse.getY()){
  //      draussen=true;        
  //     }
  //  }return draussen;    
  //}
  
  
}