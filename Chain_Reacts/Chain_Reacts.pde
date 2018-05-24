ArrayList<Ball> balls = new ArrayList<Ball>();
final static int MOVING = 0;
final static int GROWING = 1;
final static int SHRINKING = 2;
final static int DEAD = 3;
void setup()
{
  size(600, 600);
  for (int i = 0; i < (int) random(25, 35); i += 1) {
    balls.add(new Ball());
  }
}

void draw() {
  background(50, 50, 50);
  for (Ball ball : balls) {
    ball.update();
    for (Ball otherBall : balls) {
      if (ball.isTouching(otherBall) && ball.state == MOVING && ((otherBall.state == GROWING) || (otherBall.state == SHRINKING))) ball.state = GROWING;
    }
  }
}

void mouseClicked() {
  Ball ball = new Ball();
  ball.x = mouseX;
  ball.y = mouseY;
  ball.state = GROWING;
  balls.add(ball);
}