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
      
      strokeWeight(4);
      fill(255,0,150);
      text("Versager!",random(350,1600),random(200,950));
    }
  }
  
  
}