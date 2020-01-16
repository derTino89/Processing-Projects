ArrayList<Balls> gBall;        //Bauplatz für eine Ballfabrik wird reserviert
Balken b;                      // Speicher Balkenklasse wird reserviert namens b
Spruchbuch sb;                 // Speicher Spruchbuch
 
 
void setup(){
  size(2100,1400);
  gBall = new ArrayList<Balls>();       //Ballfabrik wird gebaut
  b=new Balken();                       //Balken wird gebaut
  sb=new Spruchbuch(0);                 //Spruchbuch wird geschrieben mit 0 Tics im Counter
  frameRate(30);
 
}

void draw(){
  background(150);
  sb.tic();                         //Spruchbuchcounter tickt runter
  sb.versager();                    //Wenn der Counter nicht 0 ist, erscheint Versager
  b.move();                         //Die Balkenfortbewegungsrechenmaschiene wird angeschmissen
  b.render();                       //Das Balkenmalprogramm wird aufgerufen
  for(int i=0;i<gBall.size();i++){
    gBall.get(i).move();            //bei mehreren Bällen wird hier für jeden die Bewegungsberechnungsfunktion aufgerufen
    gBall.get(i).render();          //Für jeden Ball wird das Ballmalprogramm angeschmissen
    if(gBall.get(i).kill()==true){  //Es wird geprüft ob sich ein Ball an der Grenze des Programmfensters befindet der eventuell ausgelöscht werden sollte
     gBall.remove(i);               //als denn , insofern dieser Fall eintritt, so wird der beschuldigte Ball fortan nurnoch in Erinnerung existieren     
     sb.setTime(20);                //Tic-Zahl für das Spruchbuch wird gesetzt
    } 
  }
  
}

void mouseReleased(){
  gBall.add(new Balls(b.ausgabex()+b.ausgabebreite()/2, b.ausgabey() -b.ausgabehoehe())); //Bei jedem Mausklick wird ein neuer Ball in der Fabrik hergestellt und zwar mittig auf dem Balken
}
  