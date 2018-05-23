class Ball
{
  float xvel =random(-5, 5);
  float yvel =random(-5, 5);
  float xcor = 30;
  float ycor= 30;
  int radius = (int) random(10,20);
  float rColor = random(0, 255);
  float gColor = random(0, 255);
  float bColor = random(0, 255);
  void move()
  {
  }
  void update()
  {
    xcor+= xvel;
    ycor+= yvel;
    if (xcor + radius >=600 || xcor - radius <= 0)
    {
      xvel *= -1;
    }
    if (ycor + radius >=600 || ycor - radius <= 0)
    {
      yvel *= -1;
    }
    fill (rColor, gColor, bColor);
    ellipse(xcor, ycor, radius*2, radius*2);
  }
}