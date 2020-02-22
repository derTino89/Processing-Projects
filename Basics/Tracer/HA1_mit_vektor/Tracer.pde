class Tracer{
FloatList _x;
FloatList _y;

Tracer(){
 _x = new FloatList();
 _y = new FloatList();
}
void trace(Vektor2D input){
  int lenght=20;
  _x.append(input.getX());
  _y.append(input.getY());
     if(_x.size()>=lenght){
     _x.remove(0);
     _y.remove(0);
     }
}

void render(){
  stroke(255);
  for(int i=_x.size()-1;i>0;i--){
   line(_x.get(i),_y.get(i),_x.get(i-1),_y.get(i-1));     
  }
}

}