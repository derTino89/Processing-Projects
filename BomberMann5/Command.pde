class Command {


  Command() {
    
  }
  

  void execute() {
    println("überschreibe mich!!");
  }
}




class restart extends Command {
Player _Pl1;
Player _Pl2;
  restart(Player Pl1, Player Pl2) {
    super();
    _Pl1=Pl1;
    _Pl2=Pl2;
  }

  void execute() {
    setup();
  }
}