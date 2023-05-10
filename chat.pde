void enemyChat() {
  stroke(255);
  strokeWeight(5);
  line(60, 100, 60, 300);
  line(60, 100, 250, 100);
  line(60, 300, 250, 300);
  line(250, 100, 250, 130);
  line(250, 230, 250, 300);
  line(250, 130, 310, 180);
  line(310, 180, 250, 230);
}

void freeChat(int x, int y) {
  strokeJoin(BEVEL);
  stroke(255);
  strokeWeight(15);
  line(x, y, x, y+200);
  line(x, y, x+600, y);
  line(x, y+200, x+600, y+200);
  line(x+600, y+200, x+600, y);
  fill(0);
  noStroke();
  rect(x+300, y+100, 600, 200);
  strokeJoin(MITER);
}
void freeText(String text1, String text2, int x, int y, int textSize) {
  fill(255);
  textSize(textSize);
  text(text1, x+300, y+50);
  text(text2, x+300, y+100);
}
void Enter(int x, int y) {
  textSize(20);
  fill(0, 255, 0);
  if (messageCount % 60 <= 40) {
    text("ENTERキーで進む...", x, y);
  }
}
