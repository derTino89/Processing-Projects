class Mouse{
Clock _clock;

  
Mouse(Clock clock){
_clock=clock;

}

boolean mouseDown(){
  if(mousePressed){
    return true;
  }
  return false;
}



}