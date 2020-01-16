class Interpol{
MovableVektor2D vek1;
MovableVektor2D vek2;
MovableVektor2D inter;
float t=0;

  
 Interpol(MovableVektor2D one, MovableVektor2D two){
   vek1=one.clone();
   vek2=two.clone();
   
 }
  
 void tic(){
   //vek1.tic();
   //vek2.tic();
   //for(int i=1;i<=100;i++){
   //  t=i*0.01;
   //  println(t);
   if(t<1){
     t=t+0.001;
     vek1.multS(1-t);
     vek2.multS(t);
     print(t);
     inter = new MovableVektor2D(vek1.addiere(vek2));
     //inter=new MovableVektor2D(vek1.multS(t).addiere(vek2.multS(1-t))); 
   }
   //}
   
 }
 
 void render(){
   _renderPol(vek1);
   _renderPol(vek2);
   _renderPol(inter);
   //for(int i=1;i<=100;i++){
   //  t=i*0.01;
   //  println(t);
   //  _renderPol(vek1.multS(1-t).addiere(vek2.multS(t)));
   //}
   println(inter.x(),inter.y());
 }
 
 void _renderPol(MovableVektor2D p)
 {
   ellipse(p.x(),p.y(),5,5);
 }
  
  
}



// V1(1-t) + V2t