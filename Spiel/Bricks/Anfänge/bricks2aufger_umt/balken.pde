class Balken{
Box Balken;
int breite;
int hoehe;
float x;
float y;
int speed;
int balkenwachstumsrate=50;
int Anfangsbreite;
boolean HitBox;

float zufallR=80;
float zufallG=80;
float zufallB=0;




  Balken(){
    Anfangsbreite = 200;
    x=width/2;
    y=height-100;
    breite=Anfangsbreite;
    hoehe=30;
    speed=25;
    
  }
  
  void move(){
    Balken=new Box(x,y,breite,hoehe);
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
    Balken.render();
  } 
  boolean isInside(float Ballx, float Bally, float Ballradius){
    HitBox=false;
    if(Balken.isInside(Ballx,Bally,Ballradius)){
      HitBox=true;
    }return HitBox;
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
  
  // Ausgabe von Variablen
  
  float ausgabex(){
    return x;
  }
  float ausgabey(){
    return y;
  }
  float ausgabebreite(){
    return breite;
  }
  float ausgabehoehe(){
    return hoehe;
  }
}