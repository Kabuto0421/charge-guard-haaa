class Enemy {
  String name;
  int hp;
  int tarn = 0;
  int random;
  PImage img;
  PFont enemyFont;
  String[] talking;

  Enemy(String name, int hp, int tarn, int random, PImage img, PFont enemyFont, String[] talking) {
    this.name = name;
    this.hp = hp;
    this.img = img;
    this.talking = talking;
    this.tarn =tarn;
    this.random = random;
    this.enemyFont = enemyFont;
  }


  void enemyMove() {

    textSize(40);
    fill(0, 255, 0);
    if (stage == 7 && obakeMove == 0) {
      obakeTalk[0] = ("@w@");
      obakeTalk[1] = ("-m-");
      obakeTalk[2] = ("^w^");
      text("???", 650, 500);
    } else {
      obakeTalk[0] = ("WAAA!!");
      obakeTalk[1] = ("BARETA!?");
      text(name, 650, 500);
    }
    text("あなた", 250, 500);
    textSize(50);
    fill(255);
    enemyChat();
    line(width/2, 450, width/2, 750);
    if (stage != 5) {
      if (tarn % random == 0) {
        textFont(enemyFont);
        textSize(48);
        if (stage == 9) {
          textSize(32);
        }
        text(talking[tarn%random], 150, 150);
        textFont(font);
        textSize(70);
        text("ハー!!", 640, 600);
      } else if (tarn % random == 1) {
        textFont(enemyFont);
        textSize(48);
        if (stage == 9) {
          textSize(28);
        }
        text(talking[tarn%random], 150, 150);
        textFont(font);
        textSize(70);
        text("溜める!", 640, 600);
      } else if (tarn % random == 2) {
        textFont(enemyFont);
        textSize(48);
        if (stage == 9) {
          textSize(32);
        }
        text(talking[tarn%random], 150, 150);
        textFont(font);
        textSize(70);
        text("守る!", 640, 600);
      }
    } else if (stage == 5) {
      stroke(255);
      strokeWeight(5);
      line(650, 530, 650, 750);

      if (tarn % random == 0) {
        textFont(enemyFont);
        text(talking[tarn%random], 150, 150);
        textFont(font);
        textSize(50);
        text("ハー!!", 540, 600);
      } else if (tarn % random == 1) {
        textFont(enemyFont);

        text(talking[tarn%random], 150, 150);
        textFont(font);
        textSize(50);
        text("溜める!", 540, 600);
      } else if (tarn % random == 2) {
        textFont(enemyFont);

        text(talking[tarn%random], 150, 150);
        textFont(font);
        textSize(50);
        text("守る!", 540, 600);
      }
      textSize(50);
      if (kinokoMove == 1) {
        text("KINOKO", 160, 210);
        textFont(font);
        textSize(50);
        text("溜める!", 740, 600);
      } else if (kinokoMove == 2) {
        text("GUARD!", 150, 210);
        textFont(font);
        textSize(50);
        text("守る!", 740, 600);
      }
      textSize(70);
    }
    if (tarn % random >= 3) {
      tarn++;
    }
    switch(choose) {
    case 0:
      text("溜める!", 240, 600);
      break;
    case 1:
      text("守る!", 240, 600);
      break;
    case 2:
      text("ハー!!", 240, 600);
      break;
    }
  }
  void display() {
    if (stage != 7 && stage != 9) {
      if (hp > 0) {
        fill(0, 255, 0);
        strokeWeight(0);
        rectMode(CORNER);
        rect(600, 200, hp*20, 50);
        image(img, width/2, 200);
      }
    } else if (stage == 7) {
      if (hp > 0) {
        if (obakeMove == 0) {
          fill(0, 255, 0);
          strokeWeight(0);
          rectMode(CORNER);
          rect(600, 200, hp*20, 50);
        } else if (obakeMove == 1) {
          fill(0, 255, 0);
          strokeWeight(0);
          rectMode(CORNER);
          rect(600, 200, hp*20, 50);
          image(img, width/2, 200);
        }
      }
    } else if (stage == 9) {
      if (hp > 0) {
        if (tateHP == 1) {
          fill(0, 255, 0);
          strokeWeight(0);
          rectMode(CORNER);
          rect(600, 200, hp*20, 50);
          image(img, width/2, 200);
          image(tate,width/2+30,250);
        } else if (tateHP == 0) {
          fill(0, 255, 0);
          strokeWeight(0);
          rectMode(CORNER);
          rect(600, 200, hp*20, 50);
          image(img, width/2, 200);
        }
      }
    }
    if (hp == 0) {
      battleTarn = 4;
    }
  }
  //choose 0:溜める
  //choose 1:守る
  //choose 2:ハー!!

  //tarn % random == 0 :ハー!
  //tarn % random == 1 :溜める
  //tarn % random == 2 :守る
  void check() {
    if (stage!= 5 && stage!= 7 && stage!= 9) {
      if (choose == 0 && tarn % random == 0) {//プレイヤーの負け
        battleCheck = 0;
      }
      if (choose == 1 && tarn % random == 0) {//セーフ(プレイヤーが守る)
        battleCheck = 1;
      }
      if (choose == 2 && tarn % random == 0) {//引き分け
        battleCheck = 2;
      }
      if ((choose == 1 && tarn % random == 1)||
        (choose == 0 && tarn % random == 2)||(choose == 1 && tarn % random == 2)) {//何も起こらない
        battleCheck = 3;
      }
      if (choose == 2 && tarn % random == 1) {//プレイヤーの勝ち
        battleCheck = 4;
      }
      if (choose == 2 && tarn % random == 2) {//守られた
        battleCheck = 5;
      }
      if ((choose == 0 && tarn % random == 1) ) {//力を溜めている
        battleCheck = 6;
      }
    }
    if (stage == 5) {
      if (choose == 0 && tarn % random == 0) {
        battleCheck = 0;
      } else if (choose == 1 && tarn % random == 0) {
        battleCheck = 1;
      } else if ((choose == 2 && tarn % random == 0)) {//引き分け
        battleCheck = 2;
      } else if ((choose == 1 && tarn % random == 1)||
        (choose == 0 && tarn % random == 2)||(choose == 1 && tarn % random == 2)||
        (choose == 0 && tarn % random == 1 && kinokoMove == 2)) {
        battleCheck = 3;
      }
      if (choose == 2 && tarn % random == 1 && kinokoMove == 1) {//プレイヤーの勝ち
        battleCheck = 4;
      }
      if ((choose == 2 && tarn % random == 2)) {//怒りきのこが守る
        battleCheck = 7;
      }
      if ((choose == 2 && kinokoMove == 2)) {//笑いきのこが守る
        battleCheck = 8;
      }

      if (choose == 0 && tarn % random == 1 && kinokoMove == 1) {//全員力を溜めている
        battleCheck = 9;
      }
      if (choose == 2 && tarn % random == 2 && kinokoMove == 2) {//二匹両方に守られた
        battleCheck = 10;
      }
    }
    if (stage == 7) {
      if (choose == 0 && tarn % random == 0) {//プレイヤーの負け
        battleCheck = 0;
      }
      if (choose == 1 && tarn % random == 0) {//セーフ(プレイヤーが守る)
        battleCheck = 1;
      }
      if (choose == 2 && tarn % random == 0) {//引き分け
        battleCheck = 2;
      }
      if ((choose == 1 && tarn % random == 1)||
        (choose == 0 && tarn % random == 2)||(choose == 1 && tarn % random == 2)) {//何も起こらない
        battleCheck = 3;
      }
      if (choose == 2 && tarn % random == 1 && obakeMove == 1) {//プレイヤーの勝ち
        battleCheck = 4;
      }
      if (choose == 2 && tarn % random == 2) {//守られた
        battleCheck = 5;
      }
      if ((choose == 0 && tarn % random == 1) ) {//力を溜めている
        battleCheck = 6;
      }
      if (choose == 2 && tarn % random == 1 && obakeMove == 0) {
        battleCheck = 11;
      }
    }
    if (stage == 9) {
      if (choose == 0 && tarn % random == 0) {//プレイヤーの負け
        battleCheck = 0;
      }
      if (choose == 1 && tarn % random == 0) {//セーフ(プレイヤーが守る)
        battleCheck = 1;
      }
      if (choose == 2 && tarn % random == 0) {//引き分け
        battleCheck = 2;
      }
      if ((choose == 1 && tarn % random == 1)||
        (choose == 0 && tarn % random == 2)||(choose == 1 && tarn % random == 2)) {//何も起こらない
        battleCheck = 3;
      }
      if (choose == 2 && tarn % random == 1 && tateHP == 1) {//盾が壊れる
        battleCheck = 12;
      }
      if (choose == 2 && tarn % random == 1 && tateHP == 0) {//プレイヤーの勝ち
        battleCheck = 4;
      }
      if (choose == 2 && tarn % random == 2) {//守られた
        battleCheck = 5;
      }
      if ((choose == 0 && tarn % random == 1) ) {//力を溜めている
        battleCheck = 6;
      }
    }
  }


  void moveChange() {
    switch(stage) {
    case 2://パンダ
      if (tarn == 2) {//二ターン目
        tarn = 3;
        random = 2;
      }//3ターン目ハー！
      if (tarn == 5) {//四ターン目ハー!
        random = 5;
      }
      if (tarn == 6) {//五ターン目は一ターン目に戻る
        tarn = 1;
        random = 2;
      }

      break;
    case 3://ウィッチ
      if (tarn == 2) {//二ターン目(守る)
        random = 3;
      }
      if (tarn == 3) {//3ターン目(守る)
        tarn = 7;
        random = 5;
      }
      if (tarn == 8) {//4ターン目(ハー！)
        random = 8;
      }
      if (tarn == 9) {
        tarn = 1;
        random = 3;
      }
      break;
    case 4:
      if (tarn == 2) {
        tarn = 1;
        random = 2;
      }
      break;

    case 6:
      if (tarn == 3) {
        random = 2;
      }
      if (tarn == 4) {
        tarn = 6;
        random = 4;
      }
      if (tarn == 7) {
        random = 7;
      }
      if (tarn == 8) {
        random = 6;
      }
      if (tarn == 9) {
        random = 8;
      }
      if (tarn == 10) {
        random = 10;
      }
      if (tarn == 11) {
        random = 11;
      }
      if (tarn == 12) {
        random = 10;
      }
      if (tarn == 13) {
        tarn = 1;
        random = 3;
      }
      break;
    case 7://obake
      if (tarn == 2) {//二ターン目
        tarn = 3;
        random = 2;
      }//3ターン目ハー！
      if (tarn == 5) {//四ターン目ハー!
        random = 5;
      }
      if (tarn == 6) {//五ターン目は一ターン目に戻る
        tarn = 1;
        random = 2;
      }
      break;

    case 8:
      if (tarn < utyujinMove) {
        random = 1;
      } else {
        tarn = 10;
        random = 9;
      }
      break;

    case 9:
      if (tarn == 1) {
        tarn = 3;
        random = 3;
      }
      if (tarn == 4) {
        tarn = 5;
      }
      if (tarn == 5) {
        if (yushaMove == 1) {//溜める
          random = 4;
        } else if (yushaMove == 2) {//ハー!!
          random = 5;
        } else if (yushaMove == 3) {//守る
          random = 3;
        }
      }
      if (tarn == 6) {
        tarn = 5;
      }
      break;
      case 11:
      if (tarn == 2) {
        tarn = 1;
        random = 2;
      }
      break;
      case 12:
      if (tarn == 2) {
        tarn = 1;
        random = 2;
      }
      break;
    }
    if(scene == 16 && storyTarn == 7){
      if (tarn == 1) {
        tarn = 3;
        random = 3;
      }
      if (tarn == 4) {
        tarn = 5;
      }
      if (tarn == 5) {
        if (yushaMove == 1) {//溜める
          random = 4;
        } else if (yushaMove == 2) {//ハー!!
          random = 5;
        } else if (yushaMove == 3) {//守る
          random = 3;
        }
      }
      if (tarn == 6) {
        tarn = 5;
      }
    }
    
  }
}
