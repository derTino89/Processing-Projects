class Spruchbuch{
  float counticount;
  
 Spruchbuch(int zeit){
   counticount = zeit;
 }

  void tic(){
    counticount--;
  }
  
  void setTime(int time){
   counticount = time; 
  }



  void leertaste(){
   textAlign(CENTER); 
   textSize(20); 
   fill(200);
   text("Press Space for Ball",width/2,height-10);  
  }
  
  
  void versager(){
    
    if(counticount>0){
      textAlign(CENTER);
      textSize(172);
      fill(255,0,150);
      text("Versager!",width/2,height/2);
    }
  }
  
  
}