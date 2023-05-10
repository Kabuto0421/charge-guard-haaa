void battleStory(int number) {
  blendMode(SCREEN);
  bgmCount++;
  background(0);
  if (scene != 16) {
    if (bgm == true) {
      if (bgmCount >= 2300) {
        sentou.rewind();
        bgmCount = 0;
      }
    } else if (bgm == false) {
      sentou.pause();
    }
  } else if (scene == 16 && storyTarn == 7) {
    if (bgm == true) {
      if (bgmCount >= 960) {
        last.rewind();
        last.play();
        bgmCount = 0;
      }
    } else if (bgm == false) {
      last.pause();
    }
  } else if (scene == 16 && storyTarn == 50) {
    if (bgm == true) {
      if (bgmCount >= 10000) {
        megalovania.rewind();
        megalovania.play();
        bgmCount = 0;
      }
    } else if (bgm == false) {
      megalovania.pause();
    }
  }

  if (battleTarn < 100) {
    if (scene != 16) {
      sentou.play();
    } else if (scene == 16 && storyTarn == 7) {
      last.play();
    } else if (scene == 16 && storyTarn == 50) {
      megalovania.play();
    }
    enemy[number].display();
    textFont(font);
    textSize(20);
    fill(255);
    text("溜めた数："+charge, 800, 100);//ここにサブ要素
    fill(0, 255, 0);
    text("選択:矢印キーまたはA,Dキー", 160, 30);
    text("決定または続ける:ENTERキー", 160, 50);
    strokeWeight(0);
    stroke(255);
    fill(0);
    strokeJoin(BEVEL);
    strokeWeight(20);
    rectMode(CENTER);
    rect(width/2, 600, 800, 300);
    textSize(70);
  }
  if (battleTarn == 100) {
    haratatu.play();
    fill(255, 0, 0);
    textFont(gameoverFont);
    text("GAME OVER", width/2, 100);
    textSize(80);
    text("Do you want to continue?", width/2, 300);
    textFont(font);
    if (choose == 0) {
      fill(#FF4805);
      text("はい", 150, 600);
      fill(255);
      text("やめます", 700, 600);
    } else if (choose == 1) {
      fill(#FF4805);
      text("やめます", 700, 600);
      fill(255);
      text("はい", 150, 600);
    }
  }

  switch(battleTarn) {
  case 0:
    playerChoice();
    if (keyPressed) {
      if (key == ENTER) {
        if (choose == 2 && charge == 0) {
          fill(255, 0, 0);
          text("打てない!!", width/2, 400);
        }
      }
    }
    break;

  case 1:
    if (scene == 16) {
      yushaMove = (int)random(1, 4);
    }
    textSize(100);
    fill(255);
    text("いっせーのーで", width/2, 600);
    kakegoe.play();
    time++;
    if (scene != 14) {
      if (time >= 80) {
        kakegoe.pause();
      }
      if (time>=90) {
        battleTarn = 2;
      }
    } else if (scene == 14) {
      if (time >= 50) {
        kakegoe.pause();
      }
      if (time>=55) {
        battleTarn = 2;
      }
    }
    break;

  case 2:
    enemy[number].moveChange();
    enemy[number].enemyMove();
    enemy[number].check();
    break;

  case 3:
    fill(255);
    textSize(70);
    switch(battleCheck) {
    case 0://プレイヤーの負け
      myHP = 0;
      fill(255, 255, 0);
      text("やられた！", width/2, 600);
      stroke(0);
      time+= 4;
      fill(255, 255, 0);
      rect(width/2, height/2, time, time);
      break;
    case 1://セーフ(守る成功)
      text("守った！", width/2, 600);
      break;
    case 2://引き分け
      if (stage == 7 && obakeMove == 0) {
        image(hikari, width/2, 200);
        text("相打ちで敵が見える！!", width/2, 600);
      } else text("相打ちだ！,まだ続くぞ！", width/2, 600);
      break;
    case 3://何も起こらない
      text("何も起こらなかった！", width/2, 600);
      break;
    case 4://プレイヤーの勝ち
      if (stage != 11 && stage != 12) {
        text("ナイス！君の勝ちだよ！", width/2, 600);
      } else if (stage == 11) {
        text("岩が砕け散った!!", width/2, 600);
      } else if (stage == 12) {
        text("看板が砕け散った!!", width/2, 600);
      }
      sentou.pause();
      break;
    case 5://守られた
      if (tateHP == 0 || storyTarn != 50) {
        image(tate, width/2, 200);
      }
      text("守られた！", width/2, 600);
      break;

    case 6://両方力を溜める
      text("お互いに力を溜めている!", width/2, 600);
      break;
    case 11:
      text("敵が見えなくて当たらない!", width/2, 600);
      break;
    case 12:
      text("盾が壊れた!もう一発!", width/2, 600);
      break;
    }
    break;
  }
  blendMode(BLEND);
}
