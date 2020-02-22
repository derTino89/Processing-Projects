class Timer{
 float _tics;
 
 Timer(float tics){
   _tics=tics;
 }
 
 void tic(){
   _tics--;
 }
 boolean over(){
   if(_tics<=0){ 
     return true; 
   }else return false;
 }

}