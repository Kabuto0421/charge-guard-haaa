void menu() {
  textSize(20);
  fill(0);
  if (menuMode == false) {
    text("[M]キー...メニューを開く", 750, 30);
  } else {

    text("[M]キー...メニューを閉じる", 750, 30);
  }
  if (menuMode == true) {
    fill(0);
    stroke(255);
    rect(width/2, height/2, 800, 800);
    line(280, 50, 280, 850);
    stroke(255);
    strokeWeight(3);
    switch(menuNumber) {
    case 1:
      triangle(60, 70, 60, 130, 105, 100);
      break;

    case 2:
      triangle(60, 170, 60, 230, 105, 200);
      break;
    case 3:
      triangle(60, 270, 60, 330, 105, 300);
      break;

    case 11:
      textSize(50);
      fill(255);
      text("スライム:", 500, 130);
      image(suraimu, 650, 130, 100, 100);
      textSize(30);
      text("レベル:"+chara.level, 400, 200);
      text("レベルが上がるまであと"+chara.level, 500, 300);
      break;

    case 12:
      textSize(50);
      fill(255);
      if (redManju == true) {

        text("・赤饅頭", 400, 130);
      }
      if (yellowManju == true) {
        text("・黄饅頭", 400, 260);
      }
      break;

    case 13:

      saveText();
      fill(0);
      triangle(300, 300, 300, 380, 370, 340);
      break;
    case 14:
      saveText();
      fill(0);
      triangle(300, 500, 300, 580, 370, 540);
      break;
    case 15:
      saveText();
      fill(0);
      triangle(300, 700, 300, 780, 370, 740);
      break;
    }

    fill(255);
    textSize(30);
    text("ステータス", 190, 100);
    text("持ち物", 200, 200);
    text("セーブ", 200, 300);
  }
}


void saveText() {
  line(280, 250, 850, 250);
  line(280, 450, 850, 450);
  line(280, 650, 850, 650);
  line(380, 250, 380, 850);
  fill(255);
  textSize(80);
  if (jarray[0].getInt(0) == 0) {
    textSize(80);
    text("冒険の書:1", 600, 330);
  } else {
    textSize(30);
    switch(jarray[0].getInt(0)) {
    case 11:
      text("いる場所:草原", 600, 300);
      break;
    case 12:
      text("いる場所:図書館", 600, 300);
      break;
    case 13:
      text("いる場所:マヨイのサバク", 600, 300);
      break;
    case 14:
      text("いる場所:ダンジョンみたいなの", 600, 300);
      break;
    case 15:
      text("いる場所:ダンジョンの奥", 600, 300);
      break;
    case 16:
      text("決戦", 600, 300);
      break;
    }
    image(suraimu, 670, 370, 100, 100);
    textSize(45);
    text("level:"+chara.level, 500, 375);
  }
  if (jarray[1].getInt(0) == 0) {
    textSize(80);
    text("冒険の書:2", 600, 530);
  } else {
    textSize(30);
    switch(jarray[1].getInt(0)) {
    case 11:
      text("いる場所:草原", 600, 500);
      break;
    case 12:
      text("いる場所:図書館", 600, 500);
      break;
    case 13:
      text("いる場所:マヨイのサバク", 600, 500);
      break;
    case 14:
      text("いる場所:ダンジョンみたいなの", 600, 500);
      break;
    case 15:
      text("いる場所:ダンジョンの奥", 600, 500);
      break;
    case 16:
      text("決戦", 600, 500);
      break;
    }
    image(suraimu, 670, 570, 100, 100);
    textSize(45);
    text("level:"+chara.level, 500, 575);
  }
  if (jarray[2].getInt(0) == 0) {
    textSize(80);
    text("冒険の書:3", 600, 730);
  } else {
    textSize(30);
    switch(jarray[2].getInt(0)) {
    case 11:
      text("いる場所:草原", 600, 700);
      break;
    case 12:
      text("いる場所:図書館", 600, 700);
      break;
    case 13:
      text("いる場所:マヨイのサバク", 600, 700);
      break;
    case 14:
      text("いる場所:ダンジョンみたいなの", 600, 700);
      break;
    case 15:
      text("いる場所:ダンジョンの奥", 600, 700);
      break;
    case 16:
      text("決戦", 600, 700);
      break;
    }
    image(suraimu, 670, 770, 100, 100);
    textSize(45);
    text("level:"+chara.level, 500, 775);
  }
}
