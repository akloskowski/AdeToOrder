class Ball
{
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;
  final float CHANGE_FACTOR = .25;
  final float MAX_RADIUS = 50;
  float dx =random(-5, 5);
  float dy =random(-5, 5);
  float x = random(100, 500);
  float y = random(100, 500);
  float rad = random(10, 20);
  float rColor = random(0, 255);
  float gColor = random(0, 255);
  float bColor = random(0, 255);
  int state = 0;
  void update()
  {
    if (state == MOVING) {
      x+= dx;
      y+= dy;
      if (x + rad >=600 || x - rad <= 0)
      {
        dx *= -1;
      }
      if (y + rad >=600 || y - rad <= 0)
      {
        dy *= -1;
      }
    } else if (state == GROWING) {
      dx = 0;
      dy = 0;
      rad += CHANGE_FACTOR;
      if (rad >= MAX_RADIUS) state = SHRINKING;
    } else if (state == SHRINKING) {
      rad -= CHANGE_FACTOR;
      if (rad <= 0) state = DEAD;
    }
    if (state != DEAD) {
      fill (rColor, gColor, bColor);
      ellipse(x, y, rad*2, rad*2);
    }
  }
  boolean isTouching(Ball ball) {
    if (this == ball) return false;
    if (ball.state == DEAD) return false;
    return sqrt(pow((x-ball.x), 2)+pow((y-ball.y), 2)) <= rad + ball.rad;
  }
}