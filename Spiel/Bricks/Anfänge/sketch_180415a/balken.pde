class balken{
int breite;
int hoehe;
float x;
float y;
int speed;
float zufallR=80;
float zufallG=80;
float zufallB=0;
int balkenwachstumsrate=50;
int Anfangsbreite;


  balken(){
    Anfangsbreite = 200;
    x=width/2;
    y=height-100;
    breite=Anfangsbreite;
    hoehe=30;
    speed=25;
  }
  
  void move(){
    if (keyPressed){
     if(key==CODED){ 
       if(keyCode==LEFT && x>breite/2){
         x=x-speed;
       }
       if(keyCode==RIGHT && x<width-breite/2){
         x=x+speed;
       }
     }
    }
  }
  
  void render(){
    fill(zufallR,zufallG,zufallB);
    rectMode(CENTER);
    rect(x,y,breite, hoehe);
  } 
  
  float ausgabex(){
    return x;
   }
  float ausgabebreite(){
    return breite;
  }
   
  void changecolorofbalken(){
    zufallR=random(0,255);
    zufallG=random(0,255);
    zufallB=random(0,255);
  }
  void werdebreiter(){
    breite=breite+balkenwachstumsrate;
  }
  void breitenreset(){
    breite=Anfangsbreite-100;
  }
}