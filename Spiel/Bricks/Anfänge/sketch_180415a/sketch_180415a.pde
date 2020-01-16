ArrayList<Balls> Ballschrank;  //Bauplatz für eine Ballfabrik wird reserviert
balken b; // Speicher Balkenklasse wird reserviert namens b
spruchbuch sb;
float count =0;
 
 
void setup(){
  size(1600,900);
  Ballschrank = new ArrayList<Balls>(); //Ballfabrik wird gebaut
  b=new balken(); //Balken wird gebaut
  sb=new spruchbuch(100);
  frameRate(30);
 
}

void draw(){
  background(150);
  if (count>0 )
    sb.versager();
    count--;
  b.move(); // Die Balkenfortbewegungsrechenmaschiene wird angeschmissen
  b.render(); // Das Balkenmalprogramm wird aufgerufen
  for(int i=0;i<Ballschrank.size();i++){
    Ballschrank.get(i).move(); //bei mehreren Bällen wird hier für jeden die Bewegungsberechnungsfunktion aufgerufen
    Ballschrank.get(i).render(); // Für jeden Ball wird das Ballmalprogramm angeschmissen
    if(Ballschrank.get(i).kill()==true){ //Es wird geprüft ob sich ein Ball an der Grenze des Programmfensters befindet der eventuell ausgelöscht werden sollte
     Ballschrank.remove(i); //als denn , insofern dieser Fall eintritt, so wird der beschuldigte Ball fortan nurnoch in Erinnerung existieren
     print("ToT !!!"); //hier sein Grabstein
     count = 50;
    }
  }
  
}

void mouseReleased(){
  Ballschrank.add(new Balls(mouseX, mouseY-50)); //Bei jedem Mausklick wird ein neuer Ball in der Fabrik hergestellt
}
  