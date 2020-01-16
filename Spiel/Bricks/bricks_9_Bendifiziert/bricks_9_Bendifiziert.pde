Ballfab gBalls; // jb20180515 Der Typ deutet auf eine Factory, der Instanzname deutet auf das Produkt der Factory
Brickfab gBrickfab;
Balken gbar;                    
Spruchbuch gtextbook;           


void setup() {
  size(1300, 800);
  gbar = new Balken();                     
  gtextbook = new Spruchbuch(0);           
  gBrickfab = new Brickfab();
  gBalls = new Ballfab();
}

void draw() {
  if (keyPressed) // jb20180515 Tastaturabfrage aus gbar herausgeloest
    analyzePressedKey(); // jb20180515 Verarbeitung der Tastaturabfrage unabhängig von den Objekten
  background(150);  
  //gtextbook.leertaste();          // jb20180515 diese Extra-Methode sehe ich als Teil von "render"
  gtextbook.tic();                  //Spruchbuchcounter tickt runter
  gtextbook.render();              //Wenn der Counter nicht 0 ist, erscheint Versagerjb20180515 Methode neutraler benannt

  //gbar.move();                       //Die Balkenfortbewegungsrechenmaschiene wird angeschmissen jb20180515 zeitraubender Kommentar
  gbar.render();                     //Das Balkenmalprogramm wird aufgerufen jb20180515 redundanter Kommentar

  gBrickfab.render();                //Die Bricks werden gebaut jb20180515 Fehlerhafter Kommentar
  gBalls.init();                     //Ballfabrik steuert Bälle
}

void analyzePressedKey()
{
  if (key!=CODED)
    return; // jb20180515 zur Zeit kümmert sich diese Funktion nur um coded keys
  processCodedKey();
}

void processCodedKey()
{
  if (keyCode==LEFT)
    gbar.moveLeft(); // jb20180515 Trennung von Tastaturabfrage und Befehl an das Objekt
  else if (keyCode==RIGHT) 
    gbar.moveRight();
  else
  {
    // ignore other coded keys
  }
}

void keyPressed() {                      // Leertaste erstellt einen Ball

  if (key==' ') {
    gBalls.plusBall(gbar);
  }
}