class UI extends Listener {
ArrayList<Box2D> _walls;

  UI() {
    super();
    _walls = new ArrayList<Box2D>();
    _walls.add(new Box2D(new Vektor2D(0,0),new Vektor2D(width,50)));//Obere Wand
    _walls.add(new Box2D(new Vektor2D(0,50),new Vektor2D(50,height-100)));//Linke Wand
    _walls.add(new Box2D(new Vektor2D(width-50,50),new Vektor2D(50,height-100)));//Rechte Wand
    _walls.add(new Box2D(new Vektor2D(0,height-50),new Vektor2D(width,50)));//Untere Wand
    _walls.add(new Box2D(new Vektor2D(300,350), new Vektor2D(400,50)));
  }

  void tic() {
  }
  void render(PGraphics bitmap2D) {
    _frame();
  }
  
  ArrayList<Box2D> getWalls(){
    return _walls;
  }

  void _frame(){
    bitmap2D.stroke(255);
    bitmap2D.line(50, height-50, width-50, height-50);
    bitmap2D.line(50, 50, width-50, 50);
    bitmap2D.line(50, 50, 50, height-50);
    bitmap2D.line(width-50, 50, width-50, height-50);
    bitmap2D.fill(200);
    for(int i = 0;i<_walls.size();i++){
     _walls.get(i).render(bitmap2D); 
    }
    bitmap2D.noStroke();
    
  }
}