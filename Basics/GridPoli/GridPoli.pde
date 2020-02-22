//Für einen gemütlichen Abend hier ein paar verwirrende Zeilen vom Liebenow:
//Ich werde wohl erstmal wieder auf 2D umsteigen, da ich im 3-dimensionalen Raum noch einen ganz schönen Knoten im Kopf habe, wenn es um Bewegungskoordinierung geht.
//In der Szene versuche ich den Hintergedanken zum Programm zu beschreiben.

Scene gPoliOnNet;  // Auslagerung von Quelltext, nicht als Klasse wiederverwendbar
Grid gGreenGrid;   //zu meiner letzten Einsendung unverändert
Camera gEye;

void setup() {
  size(1600, 900, P3D);
  gPoliOnNet = new Scene(); 
  gEye = new Camera();
  gGreenGrid = new Grid();
  gGreenGrid.addLineZ(8, 50, 350); // Anzahl, Abstand, Länge
  gGreenGrid.addLineX(8, 50, 350);  
}

void draw() {  
  background(50); 
  gEye.tic();
  gGreenGrid.render();
  gPoliOnNet.tik();
  gPoliOnNet.runnerGlow(); //optional, habe versucht mit Licht zu Spielen
  gPoliOnNet.render();
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  gEye.moveDepth(e);
}
