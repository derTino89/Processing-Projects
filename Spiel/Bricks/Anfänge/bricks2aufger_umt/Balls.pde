class Balls{
float _x;  //Ballkoordinate X
float _y;  //Ballkoordinate Y
float _d;  //Balldurchmesser
float _vx; //Ballgeschwindigkeit in X-Richtung
float _vy; //Ballgeschwindigkeit in Y-Richtung
int speed=15;   //Ballfluggeschwindigkeit
int farbe = 30; //Ballfarbe

Tracer T;
int Tracerlaenge;

boolean stirb; // Terminationsvariable zum terminieren des Balles bei Verlassen des Bildschirmes im äußersten Süden

float balkenX; //X-Koordiante vom Balken
float balkenbreite;
  
  Balls(float x, float y){
    _x=x;
    _y=y;
    _vx=random(-10, 10);
    _vy=-15;
    _d=20;
    Tracerlaenge=40;
    T=new Tracer(Tracerlaenge);

  }
  
  void move(){
    
  //Bewegung des Balles und Abprallen am Bildschirmrand plus Tracer:

    _x=_x+_vx;
    _y=_y+_vy;
        
    if(_y-_d<0){
      _vy=-_vy;
    }
    if(_x+_d>width){
      _vx=-_vx;
    }
    if(_x-_d<0){
      _vx=-_vx;
    }
    
    T.move(_x,_y);
    
    
  //Abprallen des Balles am sich verlängernden Balken:
    
    
   if(b.isInside(_x,_y,_d/2)){
     _vy=-_vy;
     b.changecolorofbalken();
     b.werdebreiter();
   }
  }
  
  
  void render(){
    fill(farbe++,120,50);
    rectMode(CENTER);
    rect(_x,_y,_d,_d);
    T.render();
    if(_y>height){
       b.breitenreset();
    }
  
  }

  boolean kill(){   //Prüft ob Ball unten aus dem Bildschirmrand verschwindet
   if(_y>height)
     stirb = true;     
     return stirb;
   

    
  }
}