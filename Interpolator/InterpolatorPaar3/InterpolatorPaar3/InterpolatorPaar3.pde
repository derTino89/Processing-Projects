
ArrayList<InterpolationCalculator> gInterpolPairs;

Counter gPairNumber;
Counter gPairMember;


void setup(){
 size(800,800);
 gPairNumber = new Counter(0);
 gPairMember = new Counter(2);
 gInterpolPairs = new ArrayList<InterpolationCalculator>();
}


void draw(){
  background(100);
  for(int i=0;i<gInterpolPairs.size();i++){
    if(gInterpolPairs.get(i).hasPoint1()){
      gInterpolPairs.get(i).renderPoint1();
    }
    if(gInterpolPairs.get(i).hasTwoPoints()){
      gInterpolPairs.get(i).renderPoint2();
      gInterpolPairs.get(i).ticloop();
      gInterpolPairs.get(i).renderRunner();
    }
  }
}

void mouseReleased(){

 if(gPairMember.currentCounter()==2){  
   gInterpolPairs.add(new InterpolationCalculator());
   gInterpolPairs.get(gPairNumber.currentCounter()).addPoint1(new Vektor2D(mouseX,mouseY));   
   gPairMember.setCounter(1);
 }

   else if(gPairMember.currentCounter()==1){
   gInterpolPairs.get(gPairNumber.currentCounter()).addPoint2(new Vektor2D(mouseX,mouseY));
   gPairMember.countForward();
   gPairNumber.countForward();
 }
}