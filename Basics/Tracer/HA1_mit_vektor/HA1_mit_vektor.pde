// Tino Liebenow Hausaufgabe 1 mit einem Vektor

ArrayList<HoppingBall> gb;

void setup()
{
  size(800, 600);
  gb= new ArrayList<HoppingBall>();
}

void draw()
{
  background(0);
  
  if (mousePressed)
    gb.add(new HoppingBall(mouseX,mouseY));

  for (int i=0; i<gb.size(); i++)
  {
    gb.get(i).move();
    gb.get(i).render();
  }
}