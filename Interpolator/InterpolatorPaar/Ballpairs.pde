class Ballpairs{
 Balls _ball1;
 Balls _ball2;
 Interpol inter; 
  
 Ballpairs(Balls ball1,Balls ball2){
   _ball1 = ball1;
   _ball2 = ball2;
   inter = new Interpol(_ball1.ort(),_ball2.ort());
 }
 
 void interpolTicLoop(){
   inter.ticloop();
   inter.render();
 }
 
 
}