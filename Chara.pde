class Chara {
  int x, y;
  int level = 1;
  PImage front, left, right, back;
  Chara(int x, int y, PImage front, PImage left, PImage right, PImage back) {
    this.x = x;
    this.y = y;
    this.front = front;
    this.left = left;
    this.right = right;
    this.back = back;
  }
  void display() {
    switch(muki) {
      
    case 0:
      image(front, x, y,50,50);
      break;
    case 1:
      image(right, x, y,50,50);
      break;
    case 2:
      image(left, x, y,50,50);
      break;
    case 3:
      image(back, x, y,50,50);
      break;
    }
  }
  void levelRpg(){
    
  }
  
}
