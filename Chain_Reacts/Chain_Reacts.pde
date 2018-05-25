//stores and tracks orignal and added balls on screen in arrayList
ArrayList<Ball> balls = new ArrayList<Ball>();
final static int MOVING = 0;
final static int GROWING = 1;
final static int SHRINKING = 2;
final static int DEAD = 3;

//sets up the board
void setup()
{
  size(600, 600);
  //populates arrayList with a random nunber of balls
  for (int i = 0; i < (int) random(25, 35); i += 1) {
    balls.add(new Ball());
  }
}

//starts the touching/growing/shrinking process
void draw() {
  background(50, 50, 50);
  //for each ball in arrayList, update() modifies balls accordingly
  for (Ball ball : balls) {
    ball.update();
    //checks to see if balls are in contact with eachother 
    //and changes state of ball accordingly
    for (Ball otherBall : balls) {
      if (ball.isTouching(otherBall) && ball.state == MOVING && 
      ((otherBall.state == GROWING) || (otherBall.state == SHRINKING))) 
      ball.state = GROWING;
    }
  }
}

//creates growing circle at mouse clicks
void mouseClicked() {
  Ball ball = new Ball();
  ball.x = mouseX;
  ball.y = mouseY;
  ball.state = GROWING;
  balls.add(ball);
}
