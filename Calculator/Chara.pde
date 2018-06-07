class Chara {
  String id;
  void print( int x, int y) {
    //Prints sprite at coordinates.
    PImage img = loadImage("calcSprites/" + id + ".png");
    tint(255, 126);
    image(img, x+2, y+2);
    tint(255, 255);
    image(img, x, y);
  }
  Chara(String identification) {
    id = identification;
  }
}
