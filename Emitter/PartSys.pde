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
   float z = random(0,150);
   if(z<=75){
      _Partikel.add(new Rechteck(x,y)); 
   }else{
     _Partikel.add(new Partikel2D(x,y));
   }
 }
 
  
}