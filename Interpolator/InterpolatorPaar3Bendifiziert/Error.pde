class Error
{
  String[] stored;
  int nStored=0;
  int nMax=40;
  boolean hasError=false;
  
  int framesMax=12600;
  int alter;
  
  Error()
  {
    stored=new String[nMax];
  }
  
  void put(String msg)
  {
    if (nStored==nMax)
       return;

    //glogfile.log("Error: "+msg);
    
    stored[nStored]=msg;
    nStored++;
    hasError=true;
    alter=0;
    render();
    println(msg);
  }
  
  void render()
  {
      if (hasError==false)
       return;
     
     alter++;
     if (alter==framesMax)
     {
       hasError=false;
       return;
     }
     
     int alpha=framesMax-alter;
     if (alpha>255)
         alpha=255;
       
     fill(250,250,30,alpha);
     for (int i=0;i<nStored;i++)
        text("error:"+stored[i],10,10+22*i); 
  }
}