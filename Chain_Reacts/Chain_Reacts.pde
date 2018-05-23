Ball[] balls = new Ball[(int) random(25, 35)];
void setup()
{
  size(600, 600);
  for (int i = 0; i < balls.length; i += 1) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(50, 50, 50);
  for (Ball ball : balls) {
    ball.update();
  }
}