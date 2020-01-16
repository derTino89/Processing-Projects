class Command {
  VisualObject2D _circle;
  VisualObject3D _ball;
  Screens _screen;

  Command(VisualObject2D SuperObject, VisualObject3D obj) {
    _circle=SuperObject;
    _ball=obj;
  }
  Command() {
  }
  Command(Screens screen) {
    _screen=screen;
  }


  void execute() {
    println("überschreibe mich!!");
  }
}




class moveLeft extends Command {

  moveLeft(VisualObject2D Object, VisualObject3D obj) {
    super(Object, obj);
  }

  void execute() {
    _circle.moveLeft();
    _ball.moveLeft();
  }
}

class enlarge extends Command {

  enlarge(VisualObject2D Object, VisualObject3D obj) {
    super(Object, obj);
  }

  void execute() {
    _circle.enlarge();
    _ball.enlarge();
  }
}

class moveRight extends Command {

  moveRight(VisualObject2D Object, VisualObject3D obj) {
    super(Object, obj);
  }

  void execute() {
    _circle.moveRight();
    _ball.moveRight();
  }
}

class moveUp extends Command {

  moveUp(VisualObject2D Object, VisualObject3D obj) {
    super(Object, obj);
  }

  void execute() {
    _circle.moveUp();
    _ball.moveUp();
  }
}

class moveDown extends Command {

  moveDown(VisualObject2D Object, VisualObject3D obj) {
    super(Object, obj);
  }

  void execute() {
    _circle.moveDown();
    _ball.moveDown();
  }
}


class switchToo2D extends Command {
  Screens _screen;
  switchToo2D(Screens screen) {
    super();
    _screen=screen;
  }

  void execute() {
    _screen.twoDforeGround();
  }
}
class switchToo3D extends Command {
  Screens _screen;
  switchToo3D(Screens screen) {
    super();
    _screen=screen;
  }

  void execute() {
    _screen.threeDforeGround();
  }
}
class switchTooRender extends Command{
  Screens _screens;
  switchTooRender(Screens screens){
    super();
    _screens=screens;
  }
  void execute(){
    _screens.renderForeGround();
    _screens.renderScreen();
  }
}
