class Balken{
Box Balken;
float breite;
float hoehe;
Vektor2D BalkenGroesse;
Vektor2D BalkenOrt;
//float x;
//float y;
int speed;
int balkenwachstumsrate=50;
int Anfangsbreite;
boolean HitBox;

float zufallR=80;
float zufallG=80;
float zufallB=0;




  Balken(){
    Anfangsbreite = 200;
    hoehe=30;
    breite=Anfangsbreite;
    //x=width/2;
    //y=height-100;
    BalkenOrt=new Vektor2D(width/2,height-100);
    BalkenGroesse = new Vektor2D(breite, hoehe);
    speed=25;
    
  }
  
  void move(){
    Balken=new Box(BalkenOrt.getX(),BalkenOrt.getY(),BalkenGroesse.getX(),BalkenGroesse.getY());
    if (keyPressed){
     if(key==CODED){ 
       if(keyCode==LEFT && BalkenOrt.getX()>0){
         BalkenOrt.setX(BalkenOrt.getX()-speed);
       }
       if(keyCode==RIGHT && BalkenOrt.getX()<width-BalkenGroesse.getX()){
         BalkenOrt.setX(BalkenOrt.getX()+speed);
       }
     }
    }
  }
  
  void render(){
    fill(zufallR,zufallG,zufallB);
    Balken.render();
  } 
  //boolean isOutside(Vektor2D here, float r){
  //  if(Balken.isOutside(here,r)){
  //    HitBox = false;
  //  }return HitBox;
  //}
  boolean isInside(Vektor2D here, float r){
    HitBox=false;
    if(Balken.isInside(here, r)){
      HitBox=true;
    }return HitBox;
  }

  
   
  void changecolorofbalken(){
    zufallR=random(0,255);
    zufallG=random(0,255);
    zufallB=random(0,255);
  }
  void werdebreiter(){
    BalkenGroesse.setX(breite+balkenwachstumsrate);
    breite=breite+balkenwachstumsrate;
    BalkenOrt.setX(BalkenOrt.getX()-balkenwachstumsrate/2);
  }
  void breitenreset(){
    float Mitte = BalkenOrt.getX()+BalkenGroesse.getX()/2;
    BalkenGroesse.setX(breite=Anfangsbreite);    
    BalkenOrt.setX(Mitte-Anfangsbreite/2);
  }
  
  // Ausgabe von Variablen
  
  float ausgabex(){
    return BalkenOrt.getX();
  }
  float ausgabey(){
    return BalkenOrt.getY();
  }
  float ausgabebreite(){
    return BalkenGroesse.getX();
  }
  float ausgabehoehe(){
    return BalkenGroesse.getY();
  }
}