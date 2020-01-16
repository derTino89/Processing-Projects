class spruchbuch{
  float counticount;
  
 spruchbuch(int zeit){
   counticount = zeit;
 }

  void versager(){
    counticount--;
    if(counticount>0){
      textAlign(CENTER);
      textSize(72);
      fill(255,0,150);
      text("Versager!",width/2,height/2);
    }
  }
  
  
}