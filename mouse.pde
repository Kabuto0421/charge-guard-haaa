void mousePressed() {
  if (scene == 0) {
    if ((mouseX >= 70 && mouseX <= 370) && (mouseY<= 750 && mouseY >= 650)) {
      enter.trigger();
      scene = 1;
    }
    if ((mouseX >= 530 && mouseX <= 830)&& (mouseY <= 750 && mouseY >= 650)) {
      enter.trigger();
      scene = 2;
    }
    if ((mouseX >= 290 && mouseX <= 590) && (mouseY >= 500 && mouseY <= 600)) {
      enter.trigger();
      scene = 3;
    }
  }else if(scene == 1){
    if((mouseX >= 50 && mouseX <= 350)&&(mouseY >= 600 && mouseY <= 700)){
      enter.trigger();
      scene = 10;
    }
    if((mouseX >= 550 && mouseX <= 850)&& (mouseY>= 600 && mouseY <=700)){
      enter.trigger();
      scene = 1000;
    }
  }
}
