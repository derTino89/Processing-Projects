class Balken{
Box Balken;
float breite;  //wird im Programm verändert
float hoehe;   //bleibt konst.
Vektor2D BalkenGroesse;
Vektor2D BalkenOrt;

int speed;  //Balkengeschwindigkeit
int balkenwachstumsrate=50;
int Anfangsbreite;

float zufallR=80;
float zufallG=80;
float zufallB=0;


  Balken(){
    Anfangsbreite = 150;
    hoehe=20;
    breite=Anfangsbreite;
    BalkenOrt=new Vektor2D(width/2,height-100);
    BalkenGroesse = new Vektor2D(breite, hoehe);
    speed=25;
    Balken=new Box(BalkenOrt,BalkenGroesse);    
  }
  
  void move(){    
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

  boolean isInside(Vektor2D here, float r){
    if(Balken.isInside(here, r)){
      return true;
    }return false;
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