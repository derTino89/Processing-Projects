Ballfab gBalls;
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

  background(150);  
  gtextbook.leertaste();             //Steht immer unten im Bild
  gtextbook.tic();                   //Spruchbuchcounter tickt runter
  gtextbook.versager();              //Wenn der Counter nicht 0 ist, erscheint Versager

  gbar.move();                       //Die Balkenfortbewegungsrechenmaschiene wird angeschmissen
  gbar.render();                     //Das Balkenmalprogramm wird aufgerufen

  gBrickfab.render();                //Die Bricks werden gebaut
  gBalls.init();                     //Ballfabrik steuert Bälle

}

void keyPressed() {                      // Leertaste erstellt einen Ball
  if (key==' ') {
    gBalls.plusBall();
  }
}