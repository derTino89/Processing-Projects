class Box{
 Vektor2D VBoxOrt;
 Vektor2D VBoxGroesse;
 boolean draussenX; //negHitBoxX
 boolean draussenY; //negHitBoxY
 boolean draussen;  //negHitBox Gesamt
 
 
 Box(float x,float y, float b, float h){

   VBoxOrt=new Vektor2D(x,y);
   VBoxGroesse=new Vektor2D(b,h);
   
 }
 
 
 void render(){
   rect(VBoxOrt.getX(),VBoxOrt.getY(),VBoxGroesse.getX(),VBoxGroesse.getY());
 }
 
 //prüfen ob eine Koordinate mit zusätzlichem Radius innerhalb der Box ist
 
 //boolean isInside(Vektor2D here,float r){
 //    return !isOutside(here, r);
 //}
 //boolean isOutside(Vektor2D here, float r){
 //    if (isOutsideX(here.getX(),r)==true)
 //      if(isOutsideY(here.getY(),r)==true)
 //        draussen = true;
 //    return draussen;
  
 //}
 //boolean isOutsideX(float x, float r){
 //    if(x+r<VBoxOrt.getX())
 //      if(x-r>VBoxOrt.getX()+VBoxGroesse.getX())
 //         draussenX = true;
 //    return draussenX;
 //}
 //boolean isOutsideY(float y, float r){
 //    if(y-r<VBoxOrt.getY())
 //      if(y+r>VBoxOrt.getY()+VBoxGroesse.getY())
 //        draussenY = true;
 //    return draussenY;
 //}
 
  boolean isInside(Vektor2D here, float r){
    draussen=false;
    float x=here.getX();
    float y=here.getY();
    if(x>=VBoxOrt.getX()-r && x<=VBoxOrt.getX()+VBoxGroesse.getX()){
      if(y>=VBoxOrt.getY()-r && y<=VBoxOrt.getY()+VBoxGroesse.getY()){
        draussen=true;
        
      }
    }return draussen;
    
  }
  
  
}