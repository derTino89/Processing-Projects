class TicRenderClock{
ArrayList<Receiver> _Buttons;

  TicRenderClock(){
    _Buttons=new ArrayList<Receiver>();
  }
  
void subscribe(Receiver listener){
  _Buttons.add(listener);
}

void tic(){
  for(int i=0;i<_Buttons.size();i++)
    _Buttons.get(i).tic();
}
void render(){
  for(int i=0;i<_Buttons.size();i++)
    _Buttons.get(i).render();
}

}
