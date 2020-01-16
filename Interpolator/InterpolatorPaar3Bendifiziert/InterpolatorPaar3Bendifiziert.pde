
ArrayList<InterpolationCalculator> gInterpolPairs; // jb20180528 ok

InterpolatorFactory gFactory; // jb20180528 neu!

Error error;

void setup() {
  size(800, 800);
  error=new Error();
  gInterpolPairs = new ArrayList<InterpolationCalculator>(); // jb20180528 klar
  gFactory=new InterpolatorFactory(gInterpolPairs);
  

}


void draw() {
  background(100);
  for (int i=0; i<gInterpolPairs.size(); i++)
    gInterpolPairs.get(i).tic(); // jb20180528 Tic und render lieber trennen.
  for (int i=0; i<gInterpolPairs.size(); i++)
    gInterpolPairs.get(i).render(); // jb20180528 kürzer und für den nutzenden Code einfacher

  error.render();
}

void mouseReleased() {
  gFactory.userClicked(mouseX,mouseY);
}