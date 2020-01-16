ArrayList<Balls> gBall;        // Bauplatz für eine Ballfabrik wird reserviert
ArrayList<Bricks> gBrick;      // Brickfabrik
Balken bar;                    // Speicher Balkenklasse wird reserviert
Spruchbuch textbook;           // Speicher Spruchbuch

 
void setup(){
  size(1000,700);
  gBrick = new ArrayList<Bricks>();
  gBall = new ArrayList<Balls>();       //Ballfabrik wird gebaut
  bar=new Balken();                     //Balken wird gebaut
  textbook=new Spruchbuch(0);           //Spruchbuch wird geschrieben mit 0 Tics im Counter
  
  int Brickzahl =6;                                      // Anzahl der Bricks pro Reihe
  for(int a=50;a<width;a=a+(width/Brickzahl)){           // Bricks werden anhand der Bildbreite positioniert
    Vektor2D BrickLoc;                                   // Bricks werden erzeugt, leider 3x den gleichen Befehl für 3 Reihen
    BrickLoc = new Vektor2D(a,50);
    gBrick.add(new Bricks(BrickLoc)); 
    BrickLoc = new Vektor2D(a,100);
    gBrick.add(new Bricks(BrickLoc));
    BrickLoc = new Vektor2D(a,150);
    gBrick.add(new Bricks(BrickLoc));
  }
 
}

void draw(){
  
  background(150);  
  textbook.leertaste();
  textbook.tic();                   //Spruchbuchcounter tickt runter
  textbook.versager();              //Wenn der Counter nicht 0 ist, erscheint Versager
  
  bar.move();                       //Die Balkenfortbewegungsrechenmaschiene wird angeschmissen
  bar.render();                     //Das Balkenmalprogramm wird aufgerufen
  
  for(int i=0;i<gBall.size();i++){
    gBall.get(i).move();            //Ballbewegungsberechnungsfunktionsaufruf
    gBall.get(i).render();          //Ballmalprogramm    
    
    if(gBall.get(i).kill()==true){  //Es wird geprüft ob sich ein Ball an der Grenze des Programmfensters befindet der eventuell ausgelöscht werden sollte
     gBall.remove(i);               //als denn , insofern dieser Fall eintritt, so wird der beschuldigte Ball fortan nurnoch in Erinnerung existieren     
     textbook.setTime(70);          //Tic-Zahl für das Spruchbuch wird gesetzt   
    } 
  }
  
  
  
  for(int e=0;e<gBrick.size();e++){     // Die Bricks werden durchgeguckt und gerendert, sollte ein Ball einen Brick berühren, wird der Brick gelöscht
    gBrick.get(e).render();
    for(int i=0;i<gBall.size();i++){
      if(gBrick.get(e).isInside(gBall.get(i).ausgabeOrt(),gBall.get(i).ausgabeRad())){
        gBrick.remove(e);
      }
    }
    
  }
}

void keyPressed(){                      // Leertaste erstellt einen Ball mittig auf dem Balken
  if(key==' '){
    float radius = 10;
    gBall.add(new Balls(bar.ausgabex()+bar.ausgabebreite()/2, bar.ausgabey() -radius,radius)); 
  }
}