class PartSys{
ArrayList<Partikel2D> _Partikel;  
  
 PartSys(){
   _Partikel=new ArrayList<Partikel2D>();
 }
 
 void tic(){
   for(int i=0;i<_Partikel.size();i++){
     _Partikel.get(i).tic();
   }
 }
 
 void render(){
    for(int i=0;i<_Partikel.size();i++){
     _Partikel.get(i).render();
   }
 }
 void make(float x, float y){
   float z = random(0,250);
   if(z<=50){
      _Partikel.add(new Rechteck(x,y)); 
   }else if(z<=100){
     _Partikel.add(new Partikel2D(x,y));
   }else if(z<=150){
     _Partikel.add(new Triangle(x,y));
   }else if(z<=200){
     _Partikel.add(new RotesRechteck(x,y));
   }else{
   _Partikel.add(new HellblauesMinusZeichen(x,y));
   }
   
 }
 
  
}