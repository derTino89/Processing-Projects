class Mouse{
TicRenderClock _clock;

  
Mouse(TicRenderClock clock){
_clock=clock;

}

boolean mouseDown(){
  if(mousePressed){
    return true;
  }
  return false;
}



}
