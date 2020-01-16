class Box{
 float boxX;
 float boxY;
 int boxBreite;
 int boxHoehe;
 boolean drinne;
 
 Box(float x,float y, int b, int h){
   boxX=x;
   boxY=y;
   boxBreite=b;
   boxHoehe=h;
   
 }
 
 //void move(float x, float y){
   
 //}
 
 void render(){
   rectMode(CENTER);
   rect(boxX,boxY,boxBreite,boxHoehe);
 }
 
  boolean isInside(float x, float y, float r){
    drinne=false;
    if(x>=boxX-r-boxBreite/2 && x<=boxX+r+boxBreite/2){
      if(y>=boxY-r-boxHoehe/2 && y<=boxY+r+boxHoehe/2){
        drinne=true;
        
      }
    }return drinne;
    
  }
  
  
}