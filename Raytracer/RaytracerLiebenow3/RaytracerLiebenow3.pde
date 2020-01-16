// jb20190517 
// Das sieht schon mal sehr aufgeräumt aus, mit nur 2 globalen Variablen.
// (Jetzt nur noch eine)
// (Jetzt gar keine mehr)
// Wir vermissen einen Schattenwurf der kugel auf die Fläche, richtig?
// Ich konnte Ihr Hauptprogramm noch etwas kürzern

void setup() {
  size(1200, 900);
  new Renderer(new SceneFactory().makeBallAndFloor()).render(); // Zwei Zeilen im Setup reichen! Yipieh!
}


//void draw() {
// // gRenderer.render(); // jb20190517 Sie wollen das doch gar nicht 60 mal pro sekunde rufen, oder?
//}
