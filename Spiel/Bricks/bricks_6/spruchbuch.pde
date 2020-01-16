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


  void versager(){
    
    if(counticount>0){
      textAlign(CENTER);
      textSize(172);
      fill(255,0,150);
      text("Versager!",width/2,height/2);
    }
  }
  
  
}