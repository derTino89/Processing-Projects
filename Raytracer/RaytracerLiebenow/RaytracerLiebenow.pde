
void setup() {
  size(1200, 900);
  new Renderer(new SceneFactory().makeBallAndFloor()).render(); 
}
