void key(int number) {
  if (battleTarn == 0) {
    if (choose < 2) {
      if (key == 'd' || keyCode == RIGHT)choose++;
    }
    if (choose > 0) {
      if (key == 'a' || keyCode == LEFT)choose--;
    }
    if (key == ENTER) {
      kakegoe.rewind();
      if (choose == 0) {
        charge++;
        enemy[number].tarn++;
        battleTarn = 1;
      }
      if (choose == 1) {
        enemy[number].tarn++;
        battleTarn = 1;
      }
      if (choose == 2 && charge > 0) {
        enemy[number].tarn++;
        battleTarn = 1;
      }
      if (charge == 0 && choose == 2) {
        dameda.trigger();
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

      case 11:
        miss.trigger();
        break;
        case 12:
        bakuhatu2.trigger();
        panti.trigger();
        tateHP = 0;
        break;
      }
    }
  } else if (battleTarn == 3) {
    if (key == ENTER) {
      if (battleCheck != 4) {
        if (choose == 2) {
          charge--;
        }
        if (stage == 7) {
          if (obakeMove == 0 && battleCheck == 2) {
            obakeMove = 1;
          }
        }
        battleTarn = 0;
        time = 0;
      } else if (battleCheck == 4) {
        if (scene == 11 && storyTarn == 425) {
          storyTarn = 426;
          charge = 0;
          time = 0;
          battleTarn = 0;
          bgmCount = 0;
        }
        if (scene == 11 && storyTarn == 1001) {
          battleTarn = 0;
          storyTarn = 5;
          charge =0;
          time = 0;
          stage = 0;
          enemy[12].hp = 0;
          vA = 10;
          vD = 10;
          vS = 10;
          vW = 10;
          charaMove = true;
        }
        if(scene == 11 && storyTarn == 445){
          battleTarn = 0;
          storyTarn = 5;
          charge =0;
          time = 0;
          stage = 0;
          enemy[0].hp = 0;
          bgmCount = 0;
          encount = 0;
          charaMove = true;
        }
        if (scene == 14 && storyTarn == 5) {
          storyTarn = 6;
          stoneMove = 1;
          battleTarn = 0;
          charge = 0;
          time = 0;
          bgmCount = 0;
          bgm = true;
          danjon.rewind();
        }
        if(scene == 15){
          storyTarn = 8;
          battleTarn = 0;
          charge = 0;
          time = 0;
          bgmCount = 0;
          stage = 0;
          sentou.pause();
        }
        if(scene == 16 && storyTarn == 7){
          storyTarn = 8;
          battleTarn = 0;
          charge = 0;
          time = 0;
          bgmCount = 0;
          stage = 0;
          last.pause();
        }
        if(scene == 16 && storyTarn == 50){
          storyTarn = 51;
          battleTarn = 0;
          charge = 0;
          time = 0;
          bgmCount = 0;
          stage = 0;
          megalovania.pause();
          megalovania.rewind();
        }
        if (scene == 43) {//おばけ倒した後
          scene = 11;
          storyTarn = 43;
          chara.x = 60;
          chara.y = 400;
          battleTarn = 0;
          stage = 0;
          charge = 0;
          time = 0;
          redManju = true;
          obakeMove = 4444;
        }
        if(scene == 14 && storyTarn == 13){
          storyTarn = 14;
          suraimuMove = false;
          battleTarn = 0;
          charge = 0;
          time = 0;
          bgmCount = 0;
          bgm = true;
          danjon.rewind();
        }
      }
    }
    if (myHP == 0) {
      if (key == ENTER) {
        last.pause();
        sentou.pause();
        megalovania.pause();
        haratatu.rewind();
        battleTarn = 100;
        choose = 0;
      }
    }
  } else if (battleTarn == 100) {
    if (key == 'a' || keyCode == LEFT)choose = 0;
    if (key == 'd' || keyCode == RIGHT)choose = 1;
    if (key == ENTER) {
      if (choose == 0) {
        sentou.rewind();
        last.rewind();
        megalovania.rewind();
        gameInit();
      } else if (choose == 1) {
        exit();
      }
    }
  }
}
