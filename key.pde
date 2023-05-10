void keyPressed() {


  //メニュー
  if (menuMode == false) {
    if (key == 'm') {
      menuMode = true;
      charaMove = false;
    }
  } else if (menuMode == true) {
    if (key == 'm') {
      menuMode = false;
      charaMove = true;
      menuNumber = 1;
    }
    if (menuNumber < 4) {
      if (key == 'w' || keyCode == UP) {
        if (menuNumber > 1) {
          menuNumber--;
        }
      }
      if (key == 's' || keyCode == DOWN) {
        if (menuNumber < 3) {
          menuNumber++;
        }
      }

      switch(menuNumber) {

      case 1:
        if (key == ENTER)menuNumber = 11;
        break;

      case 2:
        if (key == ENTER)menuNumber = 12;
        break;

      case 3:
        if (key == ENTER)menuNumber = 13;
        break;
      }
    } else {
      switch(menuNumber) {
      case 11:
        if (key == 'q')menuNumber = 1;
        break;
      case 12:
        if (key == 'q')menuNumber = 1;
        break;
      case 13:
        if (key == 'q')menuNumber = 1;
        if (key == ENTER) {
          enter.trigger();
          jarray[0].setInt(0, scene)
            .setInt(1, storyTarn)
            .setInt(2, chara.x)
            .setInt(3, chara.y)
            .setBoolean(4, redManju)
            .setBoolean(5, yellowManju)
            .setInt(6, stoneMove)
            .setInt(7, danjonMove)
            .setInt(8, enemy[0].hp)
            .setBoolean(9, suraimuMove);
          saveJSONArray( jarray[0], "save1.json");
        }
        if (key == 'd') {
          jarray[0].setInt(0, 0)
            .setInt(1, 0)
            .setInt(2, 0)
            .setInt(3, 0)
            .setBoolean(4, false)
            .setBoolean(5, false)
            .setInt(6, 0)
            .setInt(7, 0)
            .setInt(8, 10)
            .setBoolean(9, false);
          saveJSONArray( jarray[0], "save1.json");
        }
        break;
      case 14:
        if (key == 'q')menuNumber = 1;
        if (key == ENTER) {
          enter.trigger();
          jarray[1].setInt(0, scene)
            .setInt(1, storyTarn)
            .setInt(2, chara.x)
            .setInt(3, chara.y)
            .setBoolean(4, redManju)
            .setBoolean(5, yellowManju)
            .setInt(6, stoneMove)
            .setInt(7, danjonMove)
            .setInt(8, enemy[0].hp)
            .setBoolean(9, suraimuMove);
          saveJSONArray( jarray[1], "save2.json");
        }
        if (key == 'd') {
          jarray[1].setInt(0, 0)
            .setInt(1, 0)
            .setInt(2, 0)
            .setInt(3, 0)
            .setBoolean(4, false)
            .setBoolean(5, false)
            .setInt(6, 0)
            .setInt(7, 0)
            .setInt(8, 10)
            .setBoolean(9, false);
          saveJSONArray( jarray[1], "save2.json");
        }
        break;
      case 15:
        if (key == 'q')menuNumber = 1;
        if (key == ENTER) {
          enter.trigger();
          jarray[2].setInt(0, scene)
            .setInt(1, storyTarn)
            .setInt(2, chara.x)
            .setInt(3, chara.y)
            .setBoolean(4, redManju)
            .setBoolean(5, yellowManju)
            .setInt(6, stoneMove)
            .setInt(7, danjonMove)
            .setInt(8, enemy[0].hp)
            .setBoolean(9, suraimuMove);

          saveJSONArray( jarray[2], "save3.json");
        }
        if (key == 'd') {
          jarray[2].setInt(0, 0)
            .setInt(1, 0)
            .setInt(2, 0)
            .setInt(3, 0)
            .setBoolean(4, false)
            .setBoolean(5, false)
            .setInt(6, 0)
            .setInt(7, 0)
            .setInt(8, 10)
            .setBoolean(9, false);
          saveJSONArray( jarray[2], "save3.json");
        }
        break;
      }
      if (menuNumber >= 13) {
        if (key == 'w' || keyCode == UP) {
          if (menuNumber > 13) {
            menuNumber--;
          }
        }
        if (key == 's' || keyCode == DOWN) {
          if (menuNumber < 15) {
            menuNumber++;
          }
        }
      }
    }
  }

  //メニュー
  if (charaMove == true) {
    if (key == 'w' || keyCode == UP) {
      muki = 3;
      chara.y -= vW;
    }
    if (key == 's' || keyCode == DOWN) {
      muki = 0;
      chara.y += vS;
    }
    if (key == 'd' || keyCode == RIGHT) {
      muki = 2;
      chara.x += vD;
    }
    if (key == 'a' || keyCode == LEFT) {
      muki = 1;
      chara.x -= vA;
    }
  }

  switch(scene) {
  case 2:
    if (battleTarn == 0) {
      if (hintoMode == false) {
        if (choose < 2) {
          if (key == 'd' || keyCode == RIGHT)choose++;
        }
        if (choose > 0) {
          if (key == 'a' || keyCode == LEFT)choose--;
        }
      }
      if (key == 'h') {
        if (hintoMode == false)hintoMode = true;
        else if (hintoMode == true)hintoMode = false;
      }
      if (hintoMode == false) {
        if (key == ENTER) {
          kakegoe.rewind();
          if (choose == 0) {
            charge++;
            enemy[stage].tarn++;
            if (stage == 5) {
              kinokoMove--;
              if (kinokoMove == 0) {
                kinokoMove = 2;
              }
            }
            battleTarn = 1;
          }
          if (choose == 1) {
            enemy[stage].tarn++;
            if (stage == 5) {
              kinokoMove--;
              if (kinokoMove == 0) {
                kinokoMove = 2;
              }
            }
            battleTarn = 1;
          }
          if (choose == 2 && charge > 0) {
            enemy[stage].tarn++;
            if (stage == 5) {
              kinokoMove--;
              if (kinokoMove == 0) {
                kinokoMove = 2;
              }
            }
            battleTarn = 1;
          }
          if (charge == 0 && choose == 2) {
            dameda.trigger();
          }
        }
      }
    } else if (battleTarn == 2) {//結果表示
      if (key == ENTER) {
        battleTarn = 3;
        switch(battleCheck) {
        case 0:
          bakuhatu.trigger();
          break;
        case 1:
          panti.trigger();
          break;
        case 2:

          bakuhatu.trigger();
          delay(100);
          bakuhatu2.trigger();
          break;

        case 4:
          bakuhatu2.trigger();
          break;
        case 5:

          panti.trigger();
          break;
        case 6:
          tameru.trigger();
          break;

        case 7:
          panti.trigger();
          break;

        case 8:
          panti.trigger();
          break;

        case 9:
          tameru.trigger();
          break;

        case 10:
          panti.trigger();
          panti.trigger();
          break;

        case 11:
          miss.trigger();
          break;

        case 12:
          panti.trigger();
          delay(100);
          bakuhatu.trigger();
          break;
        }
      }
    } else if (battleTarn == 3) {
      if (enemy[stage].hp > 0) {
        if (key == ENTER) {
          if (choose == 2) {
            charge--;
            if (stage == 7) {
              if (obakeMove == 0 && battleCheck == 2) {
                obakeMove = 1;
              }
            }
          }
          battleTarn = 0;
          time = 0;
        }
      }
      if (enemy[stage].hp == 0) {
        if (key == ENTER) {
          charge = 0;
          battleTarn = 4;
          time = 0;
        }
      }
      if (myHP == 0) {
        if (key == ENTER) {
          sentou.pause();
          last.pause();
          haratatu.rewind();
          battleTarn = 100;
          choose = 0;
        }
      }
    } else if (battleTarn == 4) {
      if (key == ENTER) {
        if (stage == 8) {
          bgm = false;
          bgm2 = true;
          bgmCount = 0;
          sentou.close();
          last.play();
        }
        stage++;
        charge = 0;
        battleTarn = 0;
        time = 0;
      }
    } else if (battleTarn == 100) {

      if (key == 'a' || keyCode == LEFT)choose = 0;
      if (key == 'd' || keyCode == RIGHT)choose = 1;
      if (key == ENTER) {
        if (choose == 0) {
          sentou.rewind();
          if (stage == 9) {
            last.rewind();
            last.play();
          }
          gameInit();
        } else if (choose == 1) {
          exit();
        }
      }
    } else if (battleTarn == 1000) {
      if (key == ENTER) {
        kurukuru = true;
      }
      if (key == 's') {
        kurukuru = false;
      }
    }
    break;

  case 3://遊び方
    switch(storyTarn) {
    case 0:
      if (key == ENTER)storyTarn = 1;
      break;
    case 1:
      if (key == ENTER)storyTarn = 2;
      break;
    case 2:
      if (key == ENTER)storyTarn = 3;
      break;
    case 3:
      if (key == ENTER)storyTarn = 4;
      break;
    case 4:
      if (key == ENTER)storyTarn = 5;
      break;
    case 5:
      if (key == ENTER)storyTarn = 6;
      break;
    case 6:
      if (key == ENTER)storyTarn = 7;
      break;
    case 7:
      if (key == ENTER)storyTarn = 8;
      break;
    case 8:
      if (key == ENTER)storyTarn = 9;
      break;
    case 9:
      if (key == 'a' || keyCode==LEFT) {
        storyChoice[0] = true;
      }
      if (key == 'd' || keyCode==RIGHT) {
        storyChoice[0] = false;
      }
      if (key == ENTER) {
        if (storyChoice[0] == true) {
          storyChoice[0] = false;
          storyTarn = 1;
        }
        if (storyChoice[0] == false) {
          storyTarn = 10;
        }
      }
      break;
    case 10:
      if (key == ENTER)storyTarn = 11;
      break;
    case 11:
      if (key == ENTER)storyTarn = 12;
      break;
    case 12:
      if (key == ENTER)storyTarn = 13;
      break;
    case 13:
      if (key == ENTER)storyTarn = 14;
      break;
    case 14:
      if (key == ENTER)storyTarn = 15;
      break;
    case 15:
      if (key == ENTER)storyTarn = 16;
      break;
    case 16:
      if (key == ENTER)storyTarn = 17;
      break;
    case 17:
      if (key == ENTER)storyTarn = 18;
      break;
    case 18:
      if (key == 'a' || keyCode==LEFT) {
        storyChoice[0] = true;
      }
      if (key == 'd' || keyCode==RIGHT) {
        storyChoice[0] = false;
      }
      if (key == ENTER) {
        if (storyChoice[0] == true) {
          storyTarn = 10;
        }
        if (storyChoice[0] == false) {
          storyTarn = 19;
        }
      }
      break;
    case 19:
      if (key == ENTER) {
        storyTarn = 0;
        scene = 0;
      }
      break;
      //遊び方
    }
    break;
  case 10:
    switch(storyTarn) {
    case 0:
      if (key == ENTER)storyTarn = 1;
      break;
    case 1:
      if (key == ENTER)storyTarn = 2;
      break;
    case 2:
      if (key == ENTER)storyTarn = 3;
      break;
    case 3:
      if (key == ENTER)storyTarn = 4;
      break;
    case 4:
      if (key == ENTER)storyTarn = 5;
      break;
    case 5:
      if (key == ENTER)storyTarn = 6;
      break;
    case 6:
      if (key == ENTER)storyTarn = 7;
      break;
    case 7:
      if (key == ENTER)storyTarn = 8;
      break;
    case 8:
      if (key == ENTER)storyTarn = 9;
      break;
    case 9:
      if (key == 'a' || keyCode==LEFT) {
        storyChoice[0] = true;
      }
      if (key == 'd' || keyCode==RIGHT) {
        storyChoice[0] = false;
      }
      if (key == ENTER) {
        if (storyChoice[0] == true) {
          storyTarn = 1;
        }
        if (storyChoice[0] == false) {
          storyTarn = 10;
        }
      }
      break;
    case 10:
      if (key == ENTER)storyTarn = 11;
      break;
    case 11:
      if (key == ENTER) {
        storyTarn = 0;
        scene = 11;
      }
      break;
    }
    break;
  case 11:
    switch(storyTarn) {
    case 0:
      if (key == ENTER)storyTarn = 1;
      break;
    case 1:
      if (key == ENTER)storyTarn = 2;
      break;
    case 2:
      if (key == ENTER)storyTarn = 3;
      break;
    case 3:
      if (key == ENTER)storyTarn = 4;
      break;
    case 4:
      if (key == ENTER) {
        charaMove = true;
        storyTarn = 5;
      }
      break;
    case 5:
      //muki
      //0:前 1:右 2:左 3:後ろ

      if (((chara.y >= 270 && chara.y <= 630) && chara.x == 260 && muki == 2)||
        ((chara.y >= 270 && chara.y <= 630) && chara.x == 640 && muki == 1)||
        ((chara.x >= 270 && chara.x <= 650) && chara.y == 650 && muki == 3)||
        ((chara.x >= 270 && chara.x <= 650) && chara.y == 260 && muki == 0)) {
        if (key == ENTER) {
          storyTarn = 6;
          charaMove = false;
        }
        if (key == 'b') {
          stage = 12;
          storyTarn = 1000;
          charaMove = false;
        }
      }
      if (key == ENTER) {
        if ((chara.x == 40 && chara.y <= 780 && chara.y >= 710 && muki ==2) ||
          (chara.x == 150 && chara.y <= 780 && chara.y >= 710 && muki == 1) ||
          (chara.y == 790 && chara.x <= 140 && chara.x >= 50 && muki == 3) ||
          (chara.y == 700 && chara.x <= 140 && chara.x >= 50 && muki == 4)) {
          storyTarn = 421;
          charaMove = false;
        }
      }


      if (chara.x == 880 && (chara.y >= 300 && chara.y <= 520)) {//図書館へ
        if (keyCode == RIGHT || key == 'd') {
          scene = 12;
          chara.x = 50;
          chara.y = 400;
          storyTarn = 0;
          tansaku.rewind();
        }
      }
      if (chara.x == 50 && (chara.y <= 520 && chara.y >= 300)) {//マヨイの砂漠へ
        if (keyCode == LEFT || key == 'a') {
          if (redManju == false) {
            scene = 13;
            chara.x = 880;
            chara.y = 400;
            storyTarn = 0;
            sabaku.rewind();
          } else if (yellowManju == true) {
            storyTarn = 2222;
            charaMove = false;
          }
        }
      }

      if (chara.y == 850 && (chara.x >= 380 && chara.x <= 520)) {//ダンジョンへ
        if (keyCode == DOWN || key == 's') {
          scene = 14;
          chara.x = 430;
          chara.y = 50;
          storyTarn = 0;
          danjon.rewind();
        }
      }
      if (chara.y == 10 && (chara.x <= 520 && chara.x >= 380)) {//ラスボスへ
        if (keyCode == UP || key == 'w') {
          scene = 16;
          chara.x = 430;
          chara.y = 850;
          storyTarn = 0;
        }
      }
      break;
    case 6:
      if (key == ENTER) {
        storyTarn = 7;
      }
      break;
    case 7:
      if (key == ENTER) {
        storyTarn = 5;
        charaMove = true;
      }
      break;
      /*
    case 10:
       
       key(10);
       if (battleCheck == 4) {
       if (key =='r') {
       storyTarn = 5;
       blendMode(BLEND);
       }
       }
       break;
       }
       */

    case 10:
      if (key== ENTER) {
        storyTarn = 5;
        charaMove = true;
      }
      break;
    case 11:
      if (key == 'b') {
        stage = 0;
        storyTarn = 444;
        charaMove = false;
      }
      if (key == ENTER)storyTarn = 12;
      break;
    case 12:
      if (key == ENTER)storyTarn = 13;
      break;
    case 13:
      if (key == ENTER)storyTarn = 14;
      break;
    case 14:
      if (key == ENTER)storyTarn = 15;
      break;
    case 15:
      if (key == ENTER)storyTarn = 16;
      break;
    case 16:
      if (key == ENTER)storyTarn = 17;
      break;
    case 17:
      if (key == ENTER)storyTarn = 18;
      break;
    case 18:
      if (key == ENTER)storyTarn = 19;
      break;
    case 19:
      if (key == ENTER) {
        charaMove = true;
        storyTarn =5;
        muki = 0;
        chara.x = 450;
        chara.y = 70;
      }
      break;
    case 20:
      if (key == 'b') {
        stage = 0;
        storyTarn = 444;
        charaMove = false;
      }
      if (key == ENTER)storyTarn = 21;
      break;
    case 21:
      if (key == ENTER)storyTarn = 22;
      break;
    case 22:
      if (key == ENTER)storyTarn = 23;
      break;
    case 23:
      if (key == ENTER)storyTarn = 24;
      break;
    case 24:
      if (key == ENTER)storyTarn = 25;
      break;
    case 25:
      if (key == ENTER)storyTarn = 26;
      break;
    case 26:
      if (key == ENTER) {
        storyTarn = 5;
        charaMove = true;
        enemy[0].hp = 0;
        redManju = false;
        yellowManju = false;
      }
      break;
    case 43:
      if (key == ENTER)storyTarn = 44;
      break;
    case 45:
      if (key == ENTER)storyTarn = 5;
      charaMove = true;
      break;
    case 421:
      if (key == ENTER)storyTarn = 422;
      break;

    case 422:
      if (key == 'a' || keyCode==LEFT) {
        storyChoice[0] = true;
      }
      if (key == 'd' || keyCode==RIGHT) {
        storyChoice[0] = false;
      }
      if (key == ENTER) {
        if (storyChoice[0] == true) {
          storyTarn = 423;
        }
        if (storyChoice[0] == false) {
          charaMove = true;
          storyTarn = 5;
        }
      }
      break;
    case 423:
      if (key == ENTER)storyTarn = 424;
      break;
    case 425:
      key(10);
      break;
    case 426:
      if (key == ENTER) {
        charaMove = true;
        storyTarn = 5;
      }
      break;


    case 445:
      key(0);
      break;
    case 446:
      if (key == ENTER) {
        storyTarn = 5;
        charaMove= true;
      }
      break;
    case 1001:
      key(12);
      break;
    case 2222:
      if (key == ENTER)storyTarn = 2223;
      break;
    case 2223:
      if (key == ENTER)storyTarn = 2224;
      break;
    case 2224:
      if (key == ENTER)storyTarn = 5;
      charaMove = true;
      chara.x =70;
      muki = 2;
      break;
    }
  case 12://図書館
    if (chara.x == 20 &&(chara.y <= 460 && chara.y >= 300)) {
      if (keyCode == LEFT || key == 'a') {
        scene = 11;
        storyTarn = 5;
        chara.x = 870;
        chara.y = 410;
        tansaku.pause();
        bgmCount = 0;
      }
    }
    bookKey();
    switch(storyTarn) {
    case 0:

      if (chara.x == 880 && chara.y == 850) {
        if (key == ENTER) {
          storyTarn = 100;
        }
      }
      break;
    case 100:
      if (key == ENTER)storyTarn = 101;
      break;
    }
    break;

  case 13://マヨイの砂漠
    if (chara.x == 880 &&( chara.y >= 300 && chara.y <= 520)) {
      if (keyCode == RIGHT || key == 'd') {
        scene = 11;
        storyTarn = 5;
        chara.x = 60;
        chara.y = 400;
        sabaku.pause();
      }
    }
    if (chara.x == 20 && (chara.y <= 220 && chara.y >= 60)) {
      if (keyCode == LEFT || key == 'a') {
        chara.x = 880;
        chara.y = 440;
        scene = 23;
        storyTarn++;
      }
    }
    if (chara.x == 20 && (chara.y >= 660 && chara.y <= 880)) {
      if (keyCode == LEFT || key == 'a') {
        chara.x = 880;
        chara.y = 440;
        scene = 23;
        storyTarn++;
      }
    }
    switch(storyTarn) {
    case 0:
      if (key == ENTER) {
        if (((chara.y >= 400 && chara.y <= 440) && chara.x == 340 && muki == 2)||
          ((chara.y >= 400 && chara.y <= 440) && chara.x == 420 && muki == 1)||
          ((chara.x >= 350 && chara.x <= 390) && chara.y == 450 && muki == 3)||
          ((chara.x >= 350 && chara.x <= 390) && chara.y == 390 && muki == 0)) {
          storyTarn = 1;
          charaMove = false;
        }
      }
      break;

    case 1:
      if (key == ENTER) {
        storyTarn = 0;
        charaMove = true;
      }
      break;
    }
    break;
  case 14:
    if (chara.y == 850 && chara.x >= 340 && chara.x <=480) {
      if (keyCode == DOWN || key == 's') {
        scene = 15;
        chara.x = 430;
        chara.y = 50;
        danjon.pause();
      }
    }
    if (chara.y == 10 && (chara.x <= 520 && chara.x >= 330)) {
      if (keyCode == UP || key == 'w') {
        danjon.pause();
        scene = 11;
        storyTarn = 5;
        chara.x = 450;
        chara.y = 840;
      }
    }
    switch(storyTarn) {
    case 0:
      if (chara.y == 340 && chara.x >=650 && chara.x <=700 && stoneMove == 0) {
        if (key == ENTER) {
          charaMove = false;
          storyTarn = 1;
        }
      }
      if (chara.x == 530 && chara.y >= 360 && chara.y <=460 && stoneMove == 0) {
        if (key == ENTER) {
          charaMove = false;
          storyTarn = 2;
        }
      }
      if (chara.y == 270 && chara.x >= 110 && chara.x <= 160) {
        if (key == ENTER) {
          charaMove = false;
          storyTarn = 10;
        }
      }
      if ((chara.y == 550 && chara.x >= 70 && chara.x <= 130)||
        (chara.x == 140 && chara.y >= 560 && chara.y <= 610)||
        (chara.y == 620 && chara.x >= 70 && chara.x <= 130)||
        (chara.x == 60 && chara.y >= 560 && chara.y <= 610)) {
        if (key == ENTER) {
          charaMove = false;
          storyTarn = 15;
        }
      }
      break;
    case 1:
      if (key == ENTER) {
        charaMove = true;
        storyTarn = 0;
      }
      break;
    case 2:
      if (key == ENTER)storyTarn = 3;
      break;
    case 3:
      if (key == 'a' || keyCode==LEFT) {
        storyChoice[0] = true;
      }
      if (key == 'd' || keyCode==RIGHT) {
        storyChoice[0] = false;
      }
      if (key == ENTER) {
        if (storyChoice[0] == true) {
          bgm = false;
          danjon.pause();
          storyTarn = 4;
        }
        if (storyChoice[0] == false) {
          storyTarn = 0;
          charaMove = true;
        }
      }
      break;
    case 5:
      key(11);
      break;
    case 6:
      if (key == ENTER) {
        storyTarn = 0;
        charaMove = true;
        stage = 0;
      }
      break;
    case 10:
      if (key == ENTER)storyTarn = 11;
      break;
    case 11:
      if (key == 'a' || keyCode==LEFT) {
        storyChoice[0] = true;
      }
      if (key == 'd' || keyCode==RIGHT) {
        storyChoice[0] = false;
      }
      if (key == ENTER) {
        if (storyChoice[0] == true) {
          storyTarn = 12;
          danjon.pause();
          bgm = false;
        }
        if (storyChoice[0] == false) {
          charaMove = true;
          storyTarn = 0;
        }
      }
      break;
    case 13:
      key(1);
      break;
    case 14:
      if (key == ENTER) {
        storyTarn = 0;
        charaMove = true;
      }
      break;
    case 15:
      if (key == ENTER) {
        storyTarn = 0;
        charaMove = true;
      }
      break;
    }
    break;

  case 15:
    if (chara.y == 10 && chara.x <= 520 && chara.x >= 330) {
      if (keyCode == UP || key =='w') {
        scene = 14;
        danjon.rewind();
        danjon.play();
        bgmCount = 0;
        chara.x = 410;
        chara.y = 840;
      }
    }
    switch(storyTarn) {
    case 0:
      if (key == ENTER) {
        if ((chara.y == 210 && chara.x >= 640 && chara.x <=760)||
          (chara.y == 130 && chara.x >= 640 && chara.x <= 760 )||
          (chara.x == 630 && chara.y <= 200 && chara.y >= 140)||
          (chara.x == 770 && chara.y <= 200 && chara.y >= 140)) {
          charaMove = false;
          storyTarn = 1;
        }
        if ((chara.y == 460 && chara.x <= 470 && chara.x >=390)||
          (chara.y == 330 && chara.x <= 470 && chara.x >= 390)||
          (chara.x == 380 && chara.y >= 350 && chara.y <= 440)||
          (chara.x == 480 && chara.y >= 350 && chara.y <= 440)) {
          charaMove = false;
          if (yellowManju == false) {
            storyTarn = 2;
          } else if (yellowManju == true) {
            storyTarn =10;
          }
        }
      }
      break;
    case 1:
      if (key == ENTER) {
        charaMove = true;
        storyTarn = 0;
      }
      break;
    case 2:
      if (key == ENTER)storyTarn = 3;
      break;
    case 3:
      if (key == ENTER)storyTarn = 4;
      break;
    case 4:
      if (key == ENTER)storyTarn = 5;
      break;
    case 5:
      if (key == ENTER)storyTarn = 6;
      sentou.rewind();
      break;

    case 7:
      key(3);
      break;
    case 8:
      if (key == ENTER)storyTarn = 9;
      break;
    case 9:
      if (key == ENTER) {
        storyTarn = 0;
        yellowManju = true;
        charaMove =true;
      }
      break;
    case 10:
      if (key == ENTER) {
        storyTarn = 0;
        charaMove = true;
      }
      break;
    }
    break;
  case 16:
    if (chara.y == 850 && chara.x >= 380 && chara.x <= 520) {
      if (keyCode == DOWN || key == 'w') {
        scene = 11;
        storyTarn = 5;
        chara.x = 430;
        chara.y = 50;
      }
    }
    switch(storyTarn) {
    case 0:
      if (key == ENTER) {
        if ((chara.x == 400 && chara.y <= 350 && chara.y >= 260)||
          (chara.x == 500 && chara.y <= 350 && chara.y >= 260)||
          (chara.y == 250 && chara.x >= 410 && chara.x <=490)||
          (chara.y == 360 && chara.x >= 410 && chara.x <= 490)) {
          if (redManju == false && yellowManju == false) {
            storyTarn = 1;
          }
          if (redManju == true || yellowManju == true) {
            storyTarn = 44;
          }
        }
      }
      break;
    case 1:
      if (key == ENTER)storyTarn = 2;
      break;
    case 2:
      if (key == ENTER)storyTarn = 3;
      break;
    case 3:
      if (key == ENTER)storyTarn = 4;
      break;

    case 4:
      if (key == ENTER)storyTarn = 5;
      break;
    case 5:
      if (key == ENTER)storyTarn = 6;
      break;
    case 7:
      key(9);
      break;
    case 8:
      if (key == ENTER)storyTarn = 9;
      break;
    case 9:
      if (key == ENTER)storyTarn = 10;
      break;
    case 10:
      if (key == ENTER)storyTarn = 11;
      break;
    case 11:
      if (key == ENTER)storyTarn = 12;
      break;
    case 12:
      if (key == ENTER)storyTarn = 13;
      break;
    case 13:
      if (key == ENTER) {
        scene = 10000;
      }
      break;
    case 44:
      if (key == ENTER)storyTarn = 45;
      break;
    case 45:
      if (key == ENTER)storyTarn = 46;
      break;
    case 46:
      if (key == ENTER)storyTarn = 47;
      break;
    case 47:
      if (key == ENTER)storyTarn = 48;
      break;
    case 48:
      if (key == ENTER)storyTarn = 49;
      break;
    case 50:
      key(9);
      break;
    case 51:
      if (key == ENTER)scene = 4444;
      break;
    }
    break;
  case 23:
    if (chara.x == 20 && (chara.y <= 220 && chara.y >= 60)) {
      if (keyCode == LEFT || key == 'a') {
        if (storyTarn != 4) {
          chara.x = 880;
          chara.y = 440;
          scene = 33;
          storyTarn++;
        } else if (storyTarn == 4) {
          chara.x = 100;
          chara.y = 400;
          scene = 11;
          storyTarn = 10;
        }
      }
    }
    if (chara.x == 20 && (chara.y >= 660 && chara.y <= 880)) {
      if (keyCode == LEFT || key == 'a') {
        if (storyTarn != 4) {
          chara.x = 100;
          chara.y = 400;
          scene = 11;
          storyTarn = 10;
        } else if (storyTarn == 4) {
          chara.x = 880;
          chara.y = 440;
          scene = 33;
          storyTarn++;
        }
      }
    }
    break;

  case 33:
    if (chara.x == 20 && (chara.y <= 220 && chara.y >= 60)) {
      if (keyCode == LEFT || key == 'a') {
        chara.x = 60;
        chara.y = 400;
        scene = 11;
        storyTarn = 10;
      }
    }
    if (chara.x == 20 && (chara.y >= 660 && chara.y <= 880)) {
      if (keyCode == LEFT || key == 'a') {
        chara.x = 880;
        chara.y = 440;
        if (storyTarn != 3 && storyTarn != 5) {
          scene = 33;
        }
        if (storyTarn == 3) {
          scene = 23;
        }
        if (storyTarn == 5) {
          scene = 43;
          storyTarn = 0;
          chara.x = 880;
          chara.y = 400;
          sabaku.pause();
        }
        storyTarn++;
      }
    }
    break;
    //マヨイの砂漠
  case 43:
    switch(storyTarn) {
    case 1:
      if (key == ENTER)storyTarn = 2;
      break;
    case 2:
      if (key == ENTER)storyTarn = 3;
      break;
    case 4:
      if (key == ENTER)storyTarn = 5;
      break;
    case 5:
      time = 0;
      if (key == ENTER)storyTarn = 6;
      break;
    case 7:
      key(7);
      break;
    }
    break;
  case 100:
    if (key == 'a' || keyCode == LEFT)choose = 0;
    if (key == 'd' || keyCode == RIGHT)choose = 1;
    if (key == ENTER) {
      if (choose == 0) {
        time = 0;
        scene = 43;
        storyTarn = 1;
        chara.x = 880;
        chara.y = 440;
        iWanna.pause();
      } else if (choose == 1) {
        exit();
      }
    }
    break;

  case 1000:
    //セーブ機能
    if (choose < 2) {
      if (key == 's' || keyCode == DOWN)choose++;
    }
    if (choose > 0) {
      if (key == 'w' || keyCode == UP)choose--;
    }
    if (choose == 0) {

      if (key == ENTER) {
        enter.trigger();
        scene = jarray[0].getInt(0);
        storyTarn = jarray[0].getInt(1);
        chara.x = jarray[0].getInt(2);
        chara.y = jarray[0].getInt(3);
        redManju = jarray[0].getBoolean(4);
        yellowManju = jarray[0].getBoolean(5);
        stoneMove = jarray[0].getInt(6);
        danjonMove = jarray[0].getInt(7);
        enemy[0].hp = jarray[0].getInt(8);
        suraimuMove = jarray[0].getBoolean(9);
        charaMove = true;
      }
    } else if (choose == 1) {

      if (key == ENTER) {
        enter.trigger();
        scene = jarray[1].getInt(0);
        storyTarn = jarray[1].getInt(1);
        chara.x = jarray[1].getInt(2);
        chara.y = jarray[1].getInt(3);
        redManju = jarray[1].getBoolean(4);
        yellowManju = jarray[1].getBoolean(5);
        stoneMove = jarray[1].getInt(6);
        danjonMove = jarray[1].getInt(7);
        enemy[0].hp = jarray[1].getInt(8);
        suraimuMove = jarray[1].getBoolean(9);
        charaMove = true;
      }
    } else if (choose == 2) {

      if (key == ENTER) {
        enter.trigger();
        scene = jarray[2].getInt(0);
        storyTarn = jarray[2].getInt(1);
        chara.x = jarray[2].getInt(2);
        chara.y = jarray[2].getInt(3);
        redManju = jarray[2].getBoolean(4);
        yellowManju = jarray[2].getBoolean(5);
        stoneMove = jarray[2].getInt(6);
        danjonMove = jarray[2].getInt(7);
        enemy[0].hp = jarray[2].getInt(8);
        suraimuMove = jarray[2].getBoolean(9);
        charaMove = true;
      }
    }
    //セーブ機能
    break;
  }
}

/*
if(stage == 5){
 kinokoMove++;
 if(kinokoMove == 3){
 kinokoMove = 1;
 }
 }
 */
