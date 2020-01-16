ArrayList<HoppingBall> gb;

void setup()
{
  size(2000, 1200);
  gb= new ArrayList<HoppingBall>();
}

void draw()
{
  background(0);
  //gb.move();
  //gb.render();
  
  //if (mousePressed)
  //  gb.add(new HoppingBall(mouseX,mouseY));

  for (int i=0; i<gb.size(); i++)
  {
    gb.get(i).move();
    gb.get(i).render();
  }
}

void mouseReleased(){
  gb.add(new HoppingBall(mouseX,mouseY));
  
}