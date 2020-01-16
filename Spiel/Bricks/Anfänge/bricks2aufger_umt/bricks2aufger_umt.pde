ArrayList<Balls> Ballschrank;  //Bauplatz für eine Ballfabrik wird reserviert
Balken b;                      // Speicher Balkenklasse wird reserviert namens b
Spruchbuch sb;
//float count =0;
 
 
void setup(){
  size(2100,1400);
  Ballschrank = new ArrayList<Balls>(); //Ballfabrik wird gebaut
  b=new Balken();                       //Balken wird gebaut
  sb=new Spruchbuch(0);
  frameRate(30);
 
}

void draw(){
  background(150);
  //if (count>0 ){
    sb.tic();
    sb.versager();
  //}
  //count--;
  b.move();   // Die Balkenfortbewegungsrechenmaschiene wird angeschmissen
  b.render(); // Das Balkenmalprogramm wird aufgerufen
  for(int i=0;i<Ballschrank.size();i++){
    Ballschrank.get(i).move();           //bei mehreren Bällen wird hier für jeden die Bewegungsberechnungsfunktion aufgerufen
    Ballschrank.get(i).render();         // Für jeden Ball wird das Ballmalprogramm angeschmissen
    if(Ballschrank.get(i).kill()==true){ //Es wird geprüft ob sich ein Ball an der Grenze des Programmfensters befindet der eventuell ausgelöscht werden sollte
     Ballschrank.remove(i);              //als denn , insofern dieser Fall eintritt, so wird der beschuldigte Ball fortan nurnoch in Erinnerung existieren
     print("ToT !!!");                   //hier sein Grabstein
     
     sb.setTime(100);
     //count = 50;
    } 
  }
  
}

void mouseReleased(){
  Ballschrank.add(new Balls(b.ausgabex(), b.ausgabey() -b.ausgabehoehe()/2)); //Bei jedem Mausklick wird ein neuer Ball in der Fabrik hergestellt
}
  