import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer kakegoe, haratatu, sentou, sentou2, last, tansaku, danjon, iWanna, sabaku, pikon, megalovania;
AudioSample bakuhatu, bakuhatu2, panti, tameru, dameda, miss, enter;
JSONArray[]  jarray = new JSONArray[3];

PFont goburinFont, suraimuFont, pandaFont, wittiFont, namakemonoFont, gameoverFont;
PFont dokukinokoFont, birdFont, obakeFont, utyujinFont;
PFont storyFont;
PImage goburin, suraimu, panda, witti, namakemono, dokukinoko, bird, obake, utyujin, yusha;
PImage hikari, tate;

//RPG
PImage sougen, kanban, book, sekihi, stone, kanatuban, reimu, marisa;
PImage[] map = new PImage[9];
int vD= 10, vA = 10, vW = 10, vS = 10;
char keys[];
//RPG

PImage[] parrot = new PImage[4];
Enemy[] enemy = new Enemy[20];
String[] goburinTalk = new String[2];
String[] suraimuTalk = new String[3];
String[] pandaTalk = new String[3];
String[] wittiTalk = new String[3];
String[] namakemonoTalk = new String[3];
String[] dokukinokoTalk = new String[3];
String[] birdTalk = new String[3];
String[] obakeTalk = new String[3];
String[] utyujinTalk = new String[3];
String[] yushaTalk = new String[3];
String[] eggTalk = new String[3];
String[] stoneTalk = new String[3];
String[] kanbanTalk = new String[3];
int stoneHP = 10;
int battleCheck = 0;
int battleTarn = 0;
int choose = 0;
int messageCount = 0;
int time = 0;
int charge = 0;
int myHP = 10;
int bgmCount = 0;
int scene = 0;
int stage = 0;
int nokorinoteki = 0;
int kinokoMove = 2;
int obakeMove = 0;
int utyujinMove = 0;
int yushaMove = 0;
int stoneMove = 0;
int danjonMove = 0;
boolean suraimuMove = true;
int tateHP = 1;
int k = 0;
int encount = 0;
float j = 0;
int storyTarn = 0;
int muki = 0;
int[] okibasho = new int[4];
float enemyTime = 0;
float rotate = 0;
PFont font;
boolean charaMove = false;
boolean bgm = true;
boolean bgm2 = false;
boolean kurukuru = false;
boolean hintoMode = false;
boolean menuMode = false;
int menuNumber = 1;
boolean[] choice = new boolean[3];
boolean[] storyChoice = new boolean[2];
boolean redManju = false;
boolean yellowManju = false;
PImage egg;
PImage screen[] = new PImage[10];
PImage character[] = new PImage[4];
Chara chara;
void setup() {

  size(900, 900);
  minim = new Minim(this);
  font = createFont("HGS創英角ｺﾞｼｯｸUB", 94);
  //[0]...ハー!! [1]...溜める [2]...守る
  //goburinデータ
  goburin = loadImage("goburin.png");
  goburinFont = loadFont("ComicSansMS-48.vlw");
  goburin.resize(300, 300);
  goburinTalk[0] = ("ORA!!");
  goburinTalk[1] = ("...");
  //goburinデータ

  //スライムデータ
  suraimu = loadImage("suraimu.png");
  suraimuFont = loadFont("BMKIRANGHAERANG-OTF-48.vlw");
  suraimu.resize(300, 300);
  suraimuTalk[0] = ("PuRuRuN!!");
  suraimuTalk[1] = ("puru...");
  suraimuTalk[2] = ("PURU!");
  //スライムデータ

  //パンダデータ
  panda = loadImage("panda2.png");
  pandaFont = loadFont("Papyrus-48.vlw");
  panda.resize(300, 300);
  pandaTalk[0] = ("HA!!");
  pandaTalk[1] = ("NIKAI...");
  pandaTalk[2] = ("HUNN!!");
  //パンダデータ


  //ウィッチデータ
  witti = loadImage("witti.png");
  wittiFont = loadFont("AmericanTypewriter-CondensedLight-48.vlw");
  witti.resize(300, 300);
  wittiTalk[0] = ("...!!");
  wittiTalk[1] = ("TUGI,UTU");
  wittiTalk[2] = ("...^^");
  //ウィッチデータ

  //ナマケモノデータ
  namakemono = loadImage("namakemono.png");
  namakemonoFont = loadFont("BradleyHandITCTT-Bold-48.vlw");
  namakemono.resize(300, 300);
  namakemonoTalk[1] = ("zzz...");
  namakemonoTalk[0] =("ERROR");
  namakemonoTalk[2] =("ERROR");
  //ナマケモノデータ

  //毒キノコデータ
  dokukinoko = loadImage("dokukinoko2.png");
  dokukinokoFont = loadFont("CourierNewPS-ItalicMT-48.vlw");
  dokukinoko.resize(300, 200);
  dokukinokoTalk[0] = ("YES!!");
  dokukinokoTalk[1] = ("ORERA");
  dokukinokoTalk[2] = ("GUARD!");
  //毒キノコデータ

  //鳥データ
  bird = loadImage("Bird.png");
  birdFont = loadFont("NanumBrush-48.vlw");
  bird.resize(300, 300);
  birdTalk[0] = ("KIEEE!!");
  birdTalk[1] = ("KOKE");
  birdTalk[2] = ("PIYO");
  //鳥データ

  //おばけデータ
  obake = loadImage("obake.png");
  obakeFont = loadFont("PartyLetPlain-48.vlw");
  obake.resize(300, 300);
  obakeTalk[0] = ("@w@");
  obakeTalk[1] = ("-m-");
  obakeTalk[2] = ("^w^");
  //おばけデータ

  //宇宙人データ
  utyujin= loadImage("Utyuujin.png");
  utyujinFont = loadFont("Wingdings-Regular-48.vlw");
  utyujin.resize(300, 300);
  utyujinTalk[0] = ("aghio");
  utyujinTalk[1] = (":jga:ni");
  utyujinTalk[2] = ("uoghv");
  utyujinMove = (int)random(3, 7);
  //宇宙人データ

  //勇者データ
  yusha = loadImage("yusha.png");
  yusha.resize(300, 300);
  yushaTalk[0] = ("絶対勝つ!");
  yushaTalk[1] = ("全力で行くよ!");
  yushaTalk[2] = ("効かないよ!");
  yushaMove = (int)random(1, 4);
  tate = loadImage("tate.png.gif");
  tate.resize(200, 200);
  //勇者データ

  //卵データ
  egg = loadImage("eggFace.png");
  egg.resize(300, 300);
  eggTalk[0] = ("ハー！");
  eggTalk[1] = ("溜める!");
  eggTalk[2] = ("守る!");
  //卵データ

  //石データ
  stone = loadImage("stone.png");
  stone.resize(300, 300);
  stoneTalk[0] = (".....");
  stoneTalk[1] = (".....");
  stoneTalk[2] = (".....");
  //石データ

  //看板データ
  kanban = loadImage("kanban.png");
  kanbanTalk[0] = (".....");
  kanbanTalk[1] = (".....");
  kanbanTalk[2] = (".....");
  //看板データ
  //Enemy(int hp,int tarn,int random, PImage img,PFont enemyFont,String[] talking)
  enemy[0] = new Enemy("GOBURIN", 10, 0, 2, goburin, goburinFont, goburinTalk);
  enemy[1] = new Enemy("SURAIMU", 10, 0, 4, suraimu, suraimuFont, suraimuTalk);
  enemy[2] = new Enemy("PANDA", 10, 0, 3, panda, pandaFont, pandaTalk);
  enemy[3] = new Enemy("WITTI", 10, 0, 4, witti, wittiFont, wittiTalk);
  enemy[4] = new Enemy("NAMAKEMONO", 10, 0, 2, namakemono, namakemonoFont, namakemonoTalk);
  enemy[5] = new Enemy("DOKUKINOKOS", 10, 0, 3, dokukinoko, dokukinokoFont, dokukinokoTalk);
  enemy[6] = new Enemy("BIRD", 10, 0, 3, bird, birdFont, birdTalk);
  enemy[7] = new Enemy("GHOST", 10, 0, 3, obake, obakeFont, obakeTalk);
  enemy[8] = new Enemy("UTYUJIN", 10, 0, 3, utyujin, utyujinFont, utyujinTalk);
  enemy[9] = new Enemy("YUSHA", 10, 0, 8, yusha, font, yushaTalk);
  enemy[10] = new Enemy("EGG", 10, 0, 3, egg, font, eggTalk);
  enemy[11] = new Enemy("STONE", 10, 0, 2, stone, font, stoneTalk);
  enemy[12] = new Enemy("KANBAN", 10, 0, 2, kanban, font, kanbanTalk);
  //RPGデータ
  sougen = loadImage("Story.png");
  map[0] = loadImage("kusa.png");
  map[1] = loadImage("kusa2.png");
  map[2] = loadImage("redWall.png");
  map[3] = loadImage("sand.png");
  map[4] = loadImage("takarabakoSand.png");
  map[5] = loadImage("takarabakoSand2.png");
  map[6] = loadImage("map6.png");
  map[7] = loadImage("danjon.png");
  map[8] = loadImage("lastMap.png");
  for (int i = 0; i < map.length; i++) {
    map[i].resize(900, 900);
  }
  screen[0] = loadImage("Screen1.png");
  screen[1] = loadImage("Screen2.png");
  screen[2] = loadImage("Screen3.png");
  screen[3] = loadImage("Screen4.png");
  screen[4] = loadImage("Screen5.png");
  character[0] = loadImage("suraimuFRONT.png");
  character[1] = loadImage("suraimuRIGHT.png");
  character[2] = loadImage("suraimuLEFT.png");
  character[3] = loadImage("suraimuBACK.png");
  chara = new Chara(width/2, 800, character[0], character[1], character[2], character[3]);

  book = loadImage("book.png");
  kanatuban = loadImage("kanatuban.png");
  kanatuban.resize(50, 50);
  sekihi = loadImage("sekihi.png");
  reimu = loadImage("reimu.png");
  marisa = loadImage("marisa.png");
  iWanna = minim.loadFile("Iwanna.mp3");
  danjon = minim.loadFile("danjon2.mp3");
  sabaku = minim.loadFile("MIDI.mid.mp3");
  pikon = minim.loadFile("enter.mp3");
  enter = minim.loadSample("enter.mp3");
  for (int i = 0; i < 3; i++) {
    jarray[i] = new JSONArray();
  }
  jarray[0] = loadJSONArray("save1.json");
  jarray[1] = loadJSONArray("save2.json");
  jarray[2] = loadJSONArray("save3.json");
  tansaku = minim.loadFile("tansaku.mp3");
  //RPGデータ


  //遊び方データ
  screen[5] = loadImage("Mode.png");
  screen[6] = loadImage("Story.png");
  screen[7] = loadImage("Arcade.png");
  //遊び方データ
  gameoverFont = loadFont("Serif-120.vlw");
  storyFont = loadFont("AcademyEngravedLetPlain-100.vlw");
  bakuhatu = minim.loadSample("爆発2.mp3");
  bakuhatu2 = minim.loadSample("大砲2.mp3");
  dameda = minim.loadSample("だめだ.wav");
  panti = minim.loadSample("剣で打ち合う3.mp3");
  miss = minim.loadSample("miss.wav");
  tameru = minim.loadSample("オーラ2.mp3");
  haratatu = minim.loadFile("アヒルが大笑い.mp3");
  kakegoe = minim.loadFile("kakegoe.mp3");
  sentou = minim.loadFile("sentou.mp3");
  sentou2 = minim.loadFile("sentou.mp3");
  last = minim.loadFile("lastSong.mp3");
  megalovania = minim.loadFile("Megalovania.mp3");
  hikari = loadImage("hikari.jpg");
  hikari.resize(100, 100);
  sougen = loadImage("sougen.jpg");
  sougen.resize(900, 900);


  for (int i = 0; i< 5; i++) {
    screen[i].resize(600, 600);
  }
  screen[5].resize(600, 200);
  screen[6].resize(600, 600);
  screen[7].resize(600, 600);

  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  for (int i = 0; i < 4; i++) {
    parrot[i] = loadImage("PartyParrot.png");
    parrot[i].resize(120, 120);
  }
  for (int i = 0; i < 3; i++) {
    choice[i] = false;
  }
  jarray[0] = loadJSONArray("save1.json");
  for (int i = 0; i < 2; i++) {
    storyChoice[i] = false;
  }

  sentou.setGain(-10);
  danjon.setGain(-10);
}

void draw() {
  println("X:"+chara.x);
  println("Y:"+chara.y);
  println(storyTarn);
  strokeJoin(BEVEL);
  rectMode(CENTER);
  strokeWeight(5);
  stroke(255);
  rotate+= 0.3;
  messageCount++;
  switch(scene) {
  case 0:
    textFont(font);
    background(0);
    fill(255);
    textSize(90);
    text("'溜めて守って'", width/2, 100);
    text("'ハー!!ってするやつ'", width/2, 200);
    if (rotate>= 360) {
      rotate = 0;
    }
    textSize(90);
    if (choice[0] == false) {
      fill(0);
      rect(220, 700, 300, 100);
      fill(255);
      text("STORY", 220, 690);
    }
    if ((mouseX >= 70 && mouseX <= 370) && (mouseY<= 750 && mouseY >= 650)) {
      choice[0] = true;
      fill(#4DFA0A);
      rect(220, 700, 300, 100);
      fill(255, 0, 0);
      text("START", 220+3*cos(-rotate), 690+3*sin(-rotate));
    } else choice[0] = false;

    textSize(75);
    if (choice[1] == false) {
      fill(0);
      rect(680, 700, 300, 100);
      fill(255);
      text("ARCADE", 680, 690);
    }

    if ((mouseX >= 530 && mouseX <= 830)&& (mouseY <= 750 && mouseY >= 650)) {
      choice[1] = true;
      fill(#4DFA0A);
      rect(680, 700, 300, 100);
      fill(255, 0, 0);
      text("GO!!", 680+3*3*cos(-rotate), 690+3*3*sin(-rotate));
    } else choice[1] = false;
    textSize(90);
    if (choice[2] == false) {
      fill(0);
      rect(440, 550, 300, 100);
      fill(255);
      text("遊び方", 440, 540);
    }
    if ((mouseX >= 290 && mouseX <= 590) && (mouseY >= 500 && mouseY <= 600)) {
      choice[2] = true;
      fill(#4DFA0A);
      rect(440, 550, 300, 100);
      fill(255, 0, 0);
      text("遊び方", 440+3*cos(-rotate), 540+3*sin(-rotate));
    } else choice[2] = false;
    break;

  case 1://STORY
    image(sougen, width/2, height/2);
    fill(0);
    rect(width/2, 200, 1000, 100);
    textFont(storyFont);
    fill(255);
    text("STORY MODE", width/2, 200);
    textFont(font);
    if ((mouseX >= 50 && mouseX <= 350)&&(mouseY >= 600 && mouseY <= 700)) {
      storyChoice[0] = true;
    } else storyChoice[0] = false;

    if ((mouseX >= 550 && mouseX <= 850)&& (mouseY>= 600 && mouseY <=700)) {
      storyChoice[1] = true;
    } else storyChoice[1] = false;

    if (storyChoice[0] == false) {
      fill(0);
      rect(200, 650, 300, 100);
      fill(255);
      textSize(70);
      text("初めから", 200, 650);
    } else if (storyChoice[0] == true) {
      fill(#B9FF81);
      rect(200, 650, 300, 100);
      fill(255, 0, 0);
      textSize(70);
      text("READY?", 200+3*cos(-rotate), 650+3*sin(-rotate));
    }
    if (storyChoice[1] == false) {
      fill(0);
      rect(700, 650, 300, 100);
      fill(255);
      textSize(70);
      text("続きから", 700, 650);
    } else if (storyChoice[1] == true) {
      fill(#B9FF81);
      rect(700, 650, 300, 100);
      fill(255, 0, 0);
      textSize(70);
      text("-SAVE-", 700+3*cos(-rotate), 650+3*sin(-rotate));
    }


    break;
  case 2://ARCADE
    textAlign(CENTER, CENTER);
    blendMode(SCREEN);
    bgmCount++;
    background(0);
    if (bgm == true) {
      if (bgmCount >= 2300) {
        sentou.rewind();
        bgmCount = 0;
      }
    } else if (bgm == false) {
      sentou.pause();
    }
    if (bgm2 == true) {
      if (bgmCount >= 960) {
        last.rewind();
        last.play();
        bgmCount = 0;
      }
    } else if (bgm2 == false) {
      last.pause();
    }
    if (battleTarn < 100) {
      sentou.play();
      enemy[stage].display();
      textFont(font);
      textSize(20);
      fill(255);
      text("溜めた数："+charge, 800, 100);//ここにサブ要素
      text("残りの敵："+nokorinoteki+"/10", 800, 70);
      fill(0, 255, 0);
      if (hintoMode == false) {
        text("[h]キー...ヒントを開く", 770, 30);
      } else {
        text("[h]キー...ヒントを閉じる", 770, 30);
      }
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
      textSize(20);
      text("[矢印キーかAorDキーで選択]", width/2, 700);
      fill(0, 255, 0);

      if (messageCount % 60 <= 40) {
        text("ENTERキーで決定", 750, 800);
      }
    }

    switch(battleTarn) {
    case 0:
      nokorinoteki = 10-stage;
      if (battleCheck == 12) {
        tateHP = 0;
      }
      playerChoice();
      if (hintoMode == false) {
        if (keyPressed) {
          if (key == ENTER) {
            if (choose == 2 && charge == 0) {
              fill(255, 0, 0);
              text("打てない!!", width/2, 400);
            }
          }
        }
      }
      if (hintoMode == true) {
        blendMode(BLEND);
        textAlign(LEFT, LEFT);
        fill(0);
        stroke(#A403FC);
        rect(width/2, 510, 600, 300);
        hinto();
        stroke(255);
        line(390, 400, 720, 400);
        line(390, 400, 390, 500);
        line(390, 500, 360, 540);
        line(360, 540, 390, 560);
        line(390, 560, 390, 620);
        line(390, 620, 720, 620);
        line(720, 400, 720, 620);
      } else {

        blendMode(SCREEN);
      }
      textAlign(CENTER, CENTER);
      break;

    case 1:
      yushaMove = (int)random(1, 4);
      textSize(100);
      fill(255);
      text("いっせーのーで", width/2, 600);
      kakegoe.play();
      time++;
      if (time >= 80) {
        kakegoe.pause();
      }
      if (time>=90) {
        battleTarn = 2;
      }
      break;

    case 2:
      enemy[stage].moveChange();
      enemy[stage].enemyMove();
      enemy[stage].check();
      textSize(30);
      fill(0, 255, 0);
      if (messageCount % 60 <= 40) {
        text("ENTERキーで進む...", 730, 800);
      }
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
        enemy[stage].hp = 0;
        text("ナイス！君の勝ちだよ！", width/2, 600);
        break;
      case 5://守られた
        if (stage != 9 || tateHP == 0) {
          image(tate, width/2, 200);
        }
        text("守られた！", width/2, 600);
        break;

      case 6://両方力を溜める
        text("お互いに力を溜めている!", width/2, 600);
        break;

        //ここからきのこ戦専用
      case 7:
        textSize(60);
        text("怒りきのこに守られた！？", width/2, 600);
        break;
      case 8:
        textSize(60);
        text("笑いきのこに守られた！？", width/2, 600);
        break;
      case 9:
        textSize(70);
        text("全員力を溜めている！", width/2, 600);
        break;

      case 10:
        text("二匹両方に守られた！", width/2, 600);
        break;

      case 11:
        text("敵が見えなくて当たらない!", width/2, 600);
        break;

      case 12:
        text("盾が壊れた!もう一発!", width/2, 600);
        break;
      }
      textSize(30);
      fill(0, 255, 0);
      if (messageCount % 60 <= 40) {
        text("ENTERキーで進む...", 730, 800);
      }
      break;

    case 4:
      fill(255);
      text("勝った! 次の敵が来るぞ!", width/2, 600);
      if (stage == 9) {
        battleTarn = 1000;
      }
      textSize(30);
      fill(0, 255, 0);
      if (messageCount % 60 <= 40) {
        text("ENTERキーで進む...", 730, 800);
      }
      break;
    case 1000:
      last.close();
      sentou2.play();
      enemyTime++;
      background(0);
      if (enemyTime % 90 == 0) {
        k++;
      }
      if (k > 9) {
        k = 0;
      }
      if (kurukuru == false) {
        image(enemy[k].img, width/2, 200);
      } else if (kurukuru == true) {
        image(parrot[0], 100+9*cos(rotate*1.5), 100+9*sin(rotate*1.5));
        image(parrot[1], 150+9*cos(rotate*1.5), 200+9*sin(rotate*1.5));
        image(parrot[2], 800+9*cos(rotate*1.5), 100+9*sin(rotate*1.5));
        image(parrot[3], 750+9*cos(rotate*1.5), 200+9*sin(rotate*1.5));
        image(enemy[k].img, width/2+3*cos(-rotate), 200+3*sin(-rotate));
      }
      textSize(20);
      text(enemy[k].name, width/2, 380);
      fill(0, 255, 0);
      textSize(50);
      text("GAME CLEAR!!", width/2, 500);
      text("プレイしてくれてありがとう!!", width/2, 700);
      break;
    }
    break;

  case 3://遊び方
    background(0);
    egg(200, 200, 0.7, true);
    freeChat(250, 50);
    howToPlay();
    if (storyTarn != 9 && storyTarn != 18) {
      Enter(750, 220);
    }
    break;

  case 10://チュートリアル
    background(map[0]);

    if (j < 300) {
      egg(-100+j+9*cos(-rotate), -100+j+9*sin(-rotate), 0.7, true);
      j+=2;
    } else {
      egg(-100+j, -100+j, 0.7, true);
      freeChat(250, 50);

      switch(storyTarn) {
      case 0:
        freeText("溜めて守ってハー!の世界へようこそ!", "僕はたまご!ルールを説明するね!", 250, 70, 35);
        break;
      case 1:
        freeText("このゲームは", "3つの選択肢を使って戦うよ！", 250, 70, 35);
        break;
      case 2:
        freeText("一つ目は「溜める」！", "攻撃するための力を溜めるよ", 250, 70, 35);
        image(screen[0], width/2, 570);
        break;

      case 3:
        freeText("ただ、溜めてる間に攻撃されたら", "負けてしまうから注意だよ!", 250, 70, 35);
        image(screen[1], width/2, 570);
        break;
      case 4:
        freeText("二つ目は「守る」！", "相手の攻撃から身を守れるよ！", 250, 70, 35);
        image(screen[2], width/2, 570);
        break;
      case 5:
        freeText("守っていればとりあえず安心だから", "守ってる間に相手の行動を見よう", 250, 70, 35);
        image(screen[2], width/2, 570);
        break;
      case 6:
        freeText("三つ目は「ハー」!", "どんな相手だろうと倒せる必殺技!", 250, 70, 35);
        image(screen[3], width/2, 570);
        break;
      case 7:
        freeText("溜めないと「ハー!」は打てないよ!", "しっかり「溜める」をしよう", 250, 70, 35);
        image(screen[4], width/2, 570);
        break;
      case 8:
        freeText("それに、守られたら意味がないから", "相手の隙を見極めて「ハー!」しよう!", 250, 70, 35);
        image(screen[3], width/2, 570);
        break;

      case 9:
        freeText("戦闘の説明はここまで!", "もう一回説明する?", 250, 50, 35);
        if (storyChoice[0] == true) {
          text("いいえ", 700, 200);
          fill(255, 0, 0);
        }
        text("はい", 400, 200);
        if (storyChoice[0] == false) {
          fill(255, 0, 0);
          text("いいえ", 700, 200);
        }

        break;
      case 10:
        freeText("じゃ次に探索の説明だよ", "", 250, 50, 35);
        break;
      case 11:
        freeText("いやこれは実際に行った方が早いね", "じゃ早速行っちゃおう", 250, 50, 35);
        break;
      }

      if (storyTarn != 9) {
        Enter(750, 220);
      }
    }
    break;
  case 11://探索
    background(map[1]);

    chara.display();
    if (storyTarn < 5) {
      egg(-100+j, -100+j, 0.7, true);
      freeChat(250, 50);
      switch(storyTarn) {
      case 0:
        freeText("君はスライム、操作方法は", "", 250, 70, 35);
        break;
      case 1:
        freeText("Wか↑で前に、Sか↓で後ろに、", "Aか←で左に、Dか→で右に進むよ", 250, 70, 35);
        break;
      case 2:
        freeText("調べたり話すときはENTERキー", "Mキーでメニューが開けるよ", 250, 70, 35);
        break;
      case 3:
        freeText("メニューでは、セーブができるよ", "こまめにセーブをしよう", 250, 70, 35);
        break;
      case 4:
        freeText("簡単な説明はこんな感じかな。", "それじゃ楽しんでー", 250, 70, 35);
        break;
      }
      Enter(750, 220);
    } else {

      if (enemy[0].hp == 10) {
        image(goburin, width/2, 30, 50, 50);
      }
      chara.display();
      if (enemy[12].hp == 10) {
        image(kanban, width/2, height/2);
      }
      egg(300, 2500, 0.3, true);
    }
    textSize(20);
    menu();
    if (storyTarn == 5) {
      sentou.pause();
    }

    //当たり判定
    if (enemy[12].hp == 10) {//看板のHPが10の時
      if (((chara.y >= 270 && chara.y <= 640) && chara.x == 260)||
        (chara.x == 40 && chara.y <= 780 && chara.y >= 710)) {
        vD = 0;
      } else vD = 10;

      if ((chara.y >= 270 && chara.y <= 640) && chara.x == 640||
        (chara.x == 150 && chara.y <= 780 && chara.y >= 710)) {
        vA = 0;
      } else vA = 10;
      if (((chara.x >= 270 && chara.x <= 630) && chara.y == 650)||
        (chara.y == 790 && chara.x <= 140 && chara.x >= 50)) {
        vW = 0;
      } else vW = 10;
      if ((chara.x >= 270 && chara.x <= 630) && chara.y == 260||
        (chara.y == 700 && chara.x <= 140 && chara.x >= 50)) {
        vS = 0;
      } else vS = 10;
    } else {
      if ((chara.x == 40 && chara.y <= 780 && chara.y >= 710)) {
        vD = 0;
      } else vD = 10;

      if ((chara.x == 150 && chara.y <= 780 && chara.y >= 710)) {
        vA = 0;
      } else vA = 10;
      if ((chara.y == 790 && chara.x <= 140 && chara.x >= 50)) {
        vW = 0;
      } else vW = 10;
      if ((chara.y == 700 && chara.x <= 140 && chara.x >= 50)) {
        vS = 0;
      } else vS = 10;
    }
    if (enemy[0].hp == 10) {

      if ((chara.x == 380 && chara.y <= 50) || (chara.x == 520 && chara.y <= 50) || (chara.y == 50 && chara.x >= 380 && chara.x <= 520)) {
        if ((redManju == false || yellowManju == false) && storyTarn == 5) {
          charaMove = false;
          storyTarn = 11;
        } else if ((redManju == true && yellowManju == true) && storyTarn ==5) {
          charaMove = false;
          storyTarn = 20;
        }
      }
    }
    //当たり判定
    switch(storyTarn) {
    case 6:

      freeChat(170, 600);
      freeText("クソデカ看板だ", "クソでかい看板にはこう書いてある", 170, 600, 30);
      Enter(650, 750);
      break;
    case 7:
      noStroke();
      fill(#C1630A);
      rect(width/2, height/2, 600, 500);
      rect(width/2, 700, 100, 200);
      fill(0);
      textSize(50);
      text("←砂漠...?", 280, height/2);
      text("図書館→", 640, height/2);
      text("↑????", width/2, 270);
      text("↓ダンジョン", width/2, 650);
      Enter(730, 800);

      break;

    case 10://さばくから戻される
      charaMove = false;
      freeChat(170, 600);
      freeText("どうやら道を", "間違えてしまったらしい...", 170, 600, 30);
      Enter(650, 750);
      sabaku.pause();
      break;
    case 11://ゴブリン
      freeChat(170, 600);
      freeText("その先を進もうとすると", "ゴブリンが道を阻んできた", 170, 600, 30);
      Enter(650, 750);
      break;

    case 13:

      freeChat(170, 600);
      image(goburin, 90, 700, 200, 200);
      textFont(goburinFont);
      freeText("KONOSAKIHA", "TSUKOUDOUMEDA", 170, 600, 30);
      textFont(font);
      Enter(650, 750);
      break;
    case 14:
      break;
    case 15:

      freeChat(170, 600);
      image(goburin, 90, 700, 200, 200);
      textFont(goburinFont);
      freeText("KONOSAKINIHA,", "YUSHA SAMAGAIRU.", 170, 600, 30);
      textFont(font);
      Enter(650, 750);
      break;
    case 17:
      freeChat(170, 600);
      image(goburin, 90, 700, 200, 200);
      textFont(goburinFont);
      freeText("TOORITAKEREBA", "MANJUHUTATU,MOTTEKOI", 170, 600, 30);
      textFont(font);
      Enter(650, 750);
      break;
    case 19:
      freeChat(170, 600);
      image(goburin, 90, 700, 200, 200);
      textFont(goburinFont);
      freeText("MA,MURIDAROUGANA", "GAHAHAHAHA", 170, 600, 30);
      textFont(font);
      Enter(650, 750);
      break;
    case 20:
      freeChat(170, 600);
      image(goburin, 90, 700, 200, 200);
      textFont(goburinFont);
      freeText("KONOSAKIHA...TTEARE?", "MASAKAHONTONIMANJUWO...?", 170, 600, 30);
      textFont(font);
      Enter(650, 750);
      break;
    case 22:
      freeChat(170, 600);
      image(goburin, 90, 700, 200, 200);
      textFont(goburinFont);
      freeText("SOREKURETARA", "KOKOTOSHITEYARUZE!!", 170, 600, 30);
      textFont(font);
      Enter(650, 750);
      break;
    case 24:
      freeChat(170, 600);
      freeText("あなたは渋々饅頭二つを", "ゴブリンに差し出した...", 170, 600, 30);
      Enter(650, 750);
      image(reimu, 250, 400, 400, 400);
      image(marisa, 650, 400, 400, 400);
      break;
    case 26:
      freeChat(170, 600);
      image(goburin, 90, 700, 200, 200);
      textFont(goburinFont);
      freeText("HE!!JAKOKOTORINA", "YUSHASAMAHAOKUDAZE.", 170, 600, 30);
      textFont(font);
      Enter(650, 750);
      break;
    case 43:
      freeChat(170, 600);
      freeText("あれ?元の場所に戻ってきた。", "ん...?", 170, 600, 30);
      Enter(650, 750);
      break;
    case 45:
      freeChat(170, 600);
      freeText("いつの間にか手には赤饅頭が", "握られている...", 170, 600, 30);
      Enter(650, 750);
      image(reimu, width/2, 300, 500, 500);
      break;
    case 421:
      freeChat(170, 600);
      freeText("やあ、また会ったね。", "僕はここで練習台をしてるよ", 170, 600, 30);
      egg(100, 950, 0.75, false);
      Enter(650, 750);
      break;
    case 422:
      freeChat(170, 600);
      freeText("僕で練習していくかい?", "", 170, 600, 30);
      egg(100, 950, 0.75, false);
      if (storyChoice[0] == true) {
        text("いいえ", 650, 750);
        fill(255, 0, 0);
      }
      text("はい", 300, 750);
      if (storyChoice[0] == false) {
        fill(255, 0, 0);
        text("いいえ", 650, 750);
      }
      break;

    case 423:
      freeChat(170, 600);
      freeText("了解,じゃあ行くよ!!", "", 170, 650, 50);
      egg(100, 950, 0.75, true);
      Enter(650, 750);
      enemy[10].hp = 10;
      battleTarn = 0;
      sentou.rewind();
      break;

    case 424:
      encount+= 2;
      fill(0);
      noStroke();
      for (int i = 0; i < 10; i++) {
        rect(-70*i, 45+90*i, encount*10, 90);
        if (encount == 350) {

          storyTarn = 425;
        }
      }
      break;
    case 425:

      battleStory(10);
      encount = 0;
      break;

    case 426:
      freeChat(170, 600);
      freeText("強いね,また練習したくなったら", "僕のとこに来てね", 170, 600, 30);
      egg(100, 950, 0.75, false);
      Enter(650, 750);
      break;
    case 444:
      encount+= 2;
      fill(0);
      noStroke();
      for (int i = 0; i < 10; i++) {
        rect(-70*i, 45+90*i, encount*10, 90);
        if (encount == 350) {

          storyTarn = 445;
        }
      }
      break;
    case 445:
      battleStory(0);
      break;
    case 446:
      freeChat(170, 600);
      freeText("ゴブリンがハー!!で", "死んでしまった...", 170, 600, 30);
      Enter(650, 750);
      break;
    case 1000:
      encount+= 2;
      fill(0);
      noStroke();
      for (int i = 0; i < 10; i++) {
        rect(-70*i, 45+90*i, encount*10, 90);
        if (encount == 350) {

          storyTarn = 1001;
        }
      }
      break;
    case 1001:
      battleStory(12);
      encount = 0;
      break;
    case 2222:
      freeChat(170, 600);
      freeText("この先にはもう用はなさそうだ。", "別のとこへ行こう", 170, 600, 30);
      Enter(650, 750);
      break;
    case 2223:
      freeChat(170, 600);
      freeText("ん？一枚の紙切れが落ちている。", "何か書かれている...", 170, 600, 30);
      Enter(650, 750);
      break;
    case 2224:
      freeChat(170, 600);
      freeText("ピトショピカンピピノピ", "ノピミピピギシピピピタ", 170, 600, 30);
      Enter(650, 750);
      break;
    }
    break;

  case 12://図書館
    bgmCount++;
    tansaku.play();
    if (bgmCount >= 5000) {
      tansaku.rewind();
      bgmCount = 0;
    }
    background(map[2]);
    chara.display();
    for (int i = 0; i <5; i++) {
      image(book, i*200+100, 100, 200, 200);
    }
    textSize(20);
    fill(255);

    menu();
    fill(255);
    textSize(20);
    text("サバク", 45, 10);
    text("この世界", 145, 10);
    text("戦い", 245, 10);
    text("ボス", 345, 10);
    text("幽霊", 445, 10);
    text("昔話", 545, 10);
    text("高専", 645, 10);
    text("ダンジョン", 750, 10);
    text("饅頭", 835, 10);
    bookText();
    switch(storyTarn) {
    case 100:
      freeChat(170, 600);
      freeText("ハブラレタコトバヲ", "ニュウリョクセヨ", 170, 600, 30);
      Enter(650, 750);
      break;
    case 101:
      freeChat(170, 600);
      text(keys, width/2, height/2, 300, 300);
      break;
    }
    if (chara.y == 210) {
      vW = 0;
    } else vW = 10;

    break;

  case 13://迷いの砂漠
    bgmCount++;
    background(map[3]);
    sabaku.play();
    if (bgmCount >= 2400) {
      sabaku.rewind();
      bgmCount = 0;
    }
    image(kanban, 380, 430, 50, 50);
    chara.display();

    //当たり判定
    if (chara.x == 420 && (chara.y >= 400 && chara.y <= 440)) {
      vA = 0;
    } else vA = 10;

    if (chara.y == 450 && (chara.x <= 410 && chara.x >= 350)) {
      vW = 0;
    } else vW = 10;

    if (chara.x == 340 && (chara.y >= 400 && chara.y <= 440)) {
      vD = 0;
    } else vD = 10;

    if (chara.y == 390 && (chara.x <= 410 && chara.x >= 350)) {
      vS = 0;
    } else vS = 10;
    if (storyTarn == 1) {
      freeChat(170, 600);
      freeText("ここはマヨイの砂漠。", "正しい道を通るべし。", 170, 600, 30);
      Enter(650, 750);
    }
    menu();
    //当たり判定
    break;

  case 23://宝箱　上
    bgmCount++;
    if (bgmCount >= 2400) {
      sabaku.rewind();
      sabaku.play();
      bgmCount = 0;
    }
    background(map[4]);
    chara.display();
    break;

  case 33://宝箱　下
    bgmCount++;
    if (bgmCount >= 2400) {
      sabaku.rewind();
      sabaku.play();
      bgmCount = 0;
    }
    background(map[5]);
    chara.display();
    break;
  case 43://抜けたあと
    background(0);
    chara.display();
    switch(storyTarn) {
    case 1:
      charaMove = false;
      freeChat(170, 600);
      freeText("やけに暗い...", "ん?どこからか声が聞こえてきた...", 170, 600, 30);
      Enter(650, 750);
      break;
    case 2:
      freeChat(170, 600);
      freeText("「ハー!!!」", "嘘だろ!!?ハーが飛んできた!?", 170, 600, 30);
      Enter(650, 750);
      break;
    case 3:
      charaMove = true;
      fill(#FFEB03);
      stroke(#FFEB03);
      time++;
      rect(time*10, 400, 100, 100);
      if (time*10 >= 900) {
        storyTarn = 4;
      }
      if ((time*10-50 <= chara.x && time*10+50 >= chara.x) && (350 <= chara.y && 450 >= chara.y)) {
        iWanna.rewind();
        time = 0;
        choose = 0;
        scene = 100;
      }
      break;
    case 4:
      freeChat(170, 600);
      textFont(obakeFont);
      sentou.rewind();
      freeText("YOKERARETA...", "Nara...TYOKUSETU!", 170, 600, 30);
      Enter(650, 750);
      break;
    case 5:
      textFont(font);
      freeChat(170, 600);
      freeText("何かが迫ってきた!!", "", 170, 650, 50);
      Enter(650, 750);
      break;

    case 6:
      encount+= 2;
      fill(0);
      noStroke();
      for (int i = 0; i < 10; i++) {
        rect(-70*i, 45+90*i, encount*10, 90);
        if (encount == 350) {

          charaMove = false;
          storyTarn = 7;
        }
      }

      break;
    case 7:
      stage = 7;
      battleStory(7);
      encount = 0;

      break;
    }
    break;

  case 14://ダンジョン
    background(map[6]);
    image(kanatuban, 800, 800);
    image(kanban, 100, 600, 50, 50);
    chara.display();
    bgmCount++;

    if (bgm == true) {
      danjon.play();
    }
    if (bgmCount >= 2400) {
      danjon.rewind();
      bgmCount = 0;
    }

    if (danjonMove == 0) {

      fill(0);
      rect(400, 800, 100, 100);
      ellipse(430, 800, 10, 10);
    }
    if (suraimuMove == true) {
      image(suraimu, 130, 300, 50, 50);
    }
    if (chara.x == 800 && chara.y == 780) {
      pikon.play();
      danjonMove = 1;
    }
    //hitCheck
    switch(stoneMove) {
    case 0:
      if (suraimuMove == true) {
        if (chara.y == 40 && ((chara.x >= 480 && chara.x <= 520)|| (chara.x <= 370 && chara.x >= 330))||
          (chara.y == 340 && chara.x >=650 && chara.x <=700)||
          (chara.y == 750 && chara.x >= 380 && chara.x <= 430)||
          (chara.y == 270 && chara.x >= 110 && chara.x <= 160)||
          (chara.y == 550 && chara.x >= 70 && chara.x <= 130)||
          (chara.y == 220 && chara.x >= 170 && chara.x <=640)) {
          vS = 0;
        } else vS = 10;
      } else if (suraimuMove == false) {
        if (chara.y == 40 && ((chara.x >= 480 && chara.x <= 520)|| (chara.x <= 370 && chara.x >= 330))||
          (chara.y == 340 && chara.x >=650 && chara.x <=700)||
          (chara.y == 750 && chara.x >= 380 && chara.x <= 430)||
          (chara.y == 550 && chara.x >= 70 && chara.x <= 130)||
          (chara.y == 220 && chara.x >= 170 && chara.x <=640)) {
          vS = 0;
        } else vS = 10;
      }
      if ((chara.x == 380 && (chara.y <= 110 && chara.y >= 50))||(chara.x == 340 && chara.y <= 40 && chara.y >= 30)||
        (chara.x == 140 && chara.y >= 560 && chara.y <= 610)) {
        vA = 0;
      } else vA = 10;

      if ((chara.y == 120 && ((chara.x >= 480 && chara.x <= 700)||(chara.x <= 370 && chara.x >= 110)))||
        (chara.y == 620 && chara.x >= 70 && chara.x <= 130)) {
        vW = 0;
      } else vW = 10;

      if ((chara.x == 470 && (chara.y <= 110 && chara.y >= 50))||(chara.x == 510 && chara.y == 40)||
        (chara.x == 700 && chara.y <= 340 && chara.y >= 120)||
        (chara.x == 530 && chara.y >= 360 && chara.y <=460)||
        (chara.x == 60 && chara.y >= 560 && chara.y <= 610)) {
        vD = 0;
      } else vD = 10;
      image(stone, 650, 410, 230, 230);
      break;
    case 1:
      if (danjonMove == 0) {
        if ((chara.y == 40 && ((chara.x >= 470 && chara.x <= 520)|| (chara.x <= 370 && chara.x >= 330)))||
          (chara.y == 750 && chara.x >= 380 && chara.x <= 430)||
          (chara.y == 550 && chara.x >= 70 && chara.x <= 130)) {
          vS = 0;
        } else vS = 10;
      } else if (danjonMove == 1) {
        if (chara.y == 40 && ((chara.x >= 470 && chara.x <= 520)|| (chara.x <= 370 && chara.x >= 330))) {
          vS = 0;
        } else vS = 10;
      }
      if ((chara.x == 380 && (chara.y <= 110 && chara.y >= 50))||(chara.x == 340 && chara.y <= 40 && chara.y >= 30)||
        (chara.x == 140 && chara.y >= 560 && chara.y <= 610)) {
        vA = 0;
      } else vA = 10;

      if ((chara.y == 120 && ((chara.x >= 480 && chara.x <= 700)||(chara.x <= 370 && chara.x >= 110)))||
        (chara.y == 620 && chara.x >= 70 && chara.x <= 130)) {
        vW = 0;
      } else vW = 10;

      if ((chara.x == 470 && (chara.y <= 110 && chara.y >= 50))||(chara.x == 510 && chara.y == 40)||
        (chara.x == 700 && chara.y <= 340 && chara.y >= 120)||(chara.x == 60 && chara.y >= 560 && chara.y <= 610)) {
        vD = 0;
      } else vD = 10;
      break;
    }
    //hitCheck
    switch(storyTarn) {
    case 1:
      freeChat(170, 600);
      freeText("頑丈な岩だ。ここを通るのは", "かなり厳しそうだ。", 170, 600, 30);
      Enter(650, 750);
      break;
    case 2:
      freeChat(170, 600);
      freeText("頑丈な岩だ。ここを通るのh...ん?", "岩にヒビが入っている...", 170, 600, 30);
      Enter(650, 750);
      break;
    case 3:
      freeChat(170, 600);
      freeText("攻撃してみますか?", "", 170, 600, 30);
      if (storyChoice[0] == true) {
        text("いいえ", 650, 750);
        fill(255, 0, 0);
      }
      text("はい", 300, 750);
      if (storyChoice[0] == false) {
        fill(255, 0, 0);
        text("いいえ", 650, 750);
      }
      break;
    case 4:
      stage = 11;
      encount+= 2;
      fill(0);
      noStroke();
      for (int i = 0; i < 10; i++) {
        rect(-70*i, 45+90*i, encount*10, 90);
        if (encount == 350) {

          charaMove = false;
          storyTarn = 5;
          time = 0;
        }
      }
      break;
    case 5:
      battleStory(11);
      encount = 0;
      break;
    case 6:
      freeChat(170, 600);
      freeText("ハー!!で岩が砕け散った...", "", 170, 600, 30);
      Enter(650, 750);
      break;
    case 10:
      freeChat(170, 600);
      image(suraimu, 90, 700, 200, 200);
      textFont(suraimuFont);
      freeText("Pururun!!!", "purupuru!!", 170, 600, 30);
      textFont(font);
      Enter(650, 750);
      break;
    case 11:
      freeChat(170, 600);
      freeText("どいてくれなそうだ...戦いますか?", "", 170, 600, 30);
      if (storyChoice[0] == true) {
        text("いいえ", 650, 750);
        fill(255, 0, 0);
      }
      text("はい", 300, 750);
      if (storyChoice[0] == false) {
        fill(255, 0, 0);
        text("いいえ", 650, 750);
      }
      break;
    case 12:
      stage = 1;
      encount+= 2;
      fill(0);
      noStroke();
      for (int i = 0; i < 10; i++) {
        rect(-70*i, 45+90*i, encount*10, 90);
        if (encount == 350) {

          storyTarn = 13;
          time = 0;
        }
      }
      break;
    case 13:
      battleStory(1);
      encount = 0;
      break;
    case 14:
      freeChat(170, 600);
      freeText("スライムがどいてくれた。", "道が通れるようになった!!", 170, 600, 30);
      Enter(650, 750);
      break;
    case 15:
      freeChat(170, 600);
      freeText("岩は力を溜めるが特に", "攻撃はしてこない。安心しよう。", 170, 600, 30);
      Enter(650, 750);
      break;
    }
    menu();
    break;//ダンジョン
  case 15://ダンジョンボス
    background(map[7]);
    chara.display();
    image(sekihi, 700, 150);
    image(witti, width/2-20, 400, 100, 100);
    if ((chara.y == 210 && chara.x >= 640 && chara.x <=760)||(chara.y == 460 && chara.x <= 470 && chara.x >=390)) {
      vW = 0;
    } else vW = 10;
    if ((chara.y == 130 && chara.x >= 640 && chara.x <= 760 )|| (chara.y == 330 && chara.x <= 470 && chara.x >= 390)) {
      vS = 0;
    } else vS = 10;
    if ((chara.x == 630 && chara.y <= 200 && chara.y >= 140)|| (chara.x == 380 && chara.y >= 350 && chara.y <= 440)) {
      vD = 0;
    } else vD = 10;
    if ((chara.x == 770 && chara.y <= 200 && chara.y >= 140)|| (chara.x == 480 && chara.y >= 350 && chara.y <= 440)) {
      vA = 0;
    } else vA = 10;
    switch(storyTarn) {
    case 1:
      freeChat(170, 600);
      freeText("石碑に数字が書かれている...", "[1,2,2,0,1,2,2,0...]", 170, 600, 30);
      Enter(650, 750);
      break;
    case 2:
      freeChat(170, 600);
      image(witti, 90, 700, 200, 200);
      textFont(wittiFont);
      freeText("...YAA^^", "KIMIGASAGASHITERUNOHA", 170, 600, 30);
      textFont(font);
      Enter(650, 750);
      break;
    case 3:
      freeChat(170, 600);
      image(witti, 90, 700, 200, 200);
      textFont(wittiFont);
      freeText("KOREDARO?^^", "KOREGAHOSHINARA", 170, 600, 30);
      textFont(font);
      Enter(650, 750);
      image(marisa, width/2, 300, 500, 500);
      break;
    case 4:
      freeChat(170, 600);
      image(witti, 90, 700, 200, 200);
      textFont(wittiFont);
      freeText("BOKUNIKATTEMINAYO.", "JASASSOKU", 170, 600, 30);
      textFont(font);
      Enter(650, 750);
      break;
    case 5:
      freeChat(170, 600);
      image(witti, 90, 700, 200, 200);
      textFont(wittiFont);
      freeText("...IKUYO^^", "", 170, 650, 50);
      textFont(font);
      Enter(650, 750);
      break;
    case 6:
      encount+= 2;
      fill(0);
      noStroke();
      for (int i = 0; i < 10; i++) {
        rect(-70*i, 45+90*i, encount*10, 90);
        if (encount == 350) {

          charaMove = false;
          storyTarn = 7;
        }
      }
      break;
    case 7:
      battleStory(3);
      stage= 3;
      encount = 0;
      break;
    case 8:
      freeChat(170, 600);
      image(witti, 90, 700, 200, 200);
      textFont(wittiFont);
      freeText("TUYOINE...^^;", "JAYAKUSOKUDORIAGERUYO", 170, 600, 30);
      textFont(font);
      Enter(650, 750);
      break;
    case 9:
      freeChat(170, 600);
      freeText("黄饅頭を手に入れた!!", "", 170, 650, 50);
      Enter(650, 750);
      image(marisa, width/2, 300, 500, 500);
      break;
    case 10:
      freeChat(170, 600);
      image(witti, 90, 700, 200, 200);
      textFont(wittiFont);
      freeText("MOUBOKUNIYOUHANAIDESHO,", "MATANE^^*", 170, 600, 30);
      textFont(font);
      Enter(650, 750);
      break;
    }
    menu();
    break;//ダンジョンボス
  case 16:
    background(map[8]);
    chara.display();
    image(yusha, width/2, 300, 100, 100);
    if (chara.x == 400 && chara.y <= 350 && chara.y >= 260) {
      vD = 0;
    } else vD = 10;
    if (chara.x == 500 && chara.y <= 350 && chara.y >= 260) {
      vA = 0;
    } else vA = 10;
    if (chara.y == 250 && chara.x >= 410 && chara.x <=490) {
      vS = 0;
    } else vS = 10;

    if (chara.y == 360 && chara.x >= 410 && chara.x <= 490) {
      vW = 0;
    } else vW = 10;
    switch(storyTarn) {
    case 1:
      freeChat(170, 600);
      image(yusha, 90, 700, 200, 200);
      freeText("初めまして。僕はこの世界の勇者。", "かといって勇む相手もいないけどねw", 170, 600, 30);
      Enter(650, 750);
      break;
    case 2:
      freeChat(170, 600);
      image(yusha, 90, 700, 200, 200);
      freeText("んで、ここまできたのは一番強い僕と", "戦いたかったから、ってとこかな。", 170, 600, 30);
      Enter(650, 750);
      break;
    case 3:
      freeChat(170, 600);
      image(yusha, 90, 700, 200, 200);
      freeText("言っとくけど手は抜かないからね。", "本気で行かせてもらう。", 170, 600, 30);
      Enter(650, 750);
      break;
    case 4:
      freeChat(170, 600);
      image(yusha, 90, 700, 200, 200);
      freeText("じゃ、早速...", "", 170, 650, 50);
      Enter(650, 750);
      break;
    case 5:
      freeChat(170, 600);
      image(yusha, 90, 700, 200, 200);
      freeText("行くね。", "", 170, 650, 80);
      Enter(650, 750);
      break;
    case 6:
      encount+= 2;
      fill(0);
      noStroke();
      for (int i = 0; i < 10; i++) {
        rect(-70*i, 45+90*i, encount*10, 90);
        if (encount == 350) {

          charaMove = false;
          storyTarn = 7;
        }
      }
      break;
    case 7:
      battleStory(9);
      encount = 0;
      break;
    case 8:
      freeChat(170, 600);
      image(yusha, 90, 700, 200, 200);
      freeText("強いね...", "", 170, 650, 50);
      Enter(650, 750);
      break;
    case 9:
      freeChat(170, 600);
      image(yusha, 90, 700, 200, 200);
      freeText("あのコマンドを使ってれば", "勝てたのだろうか...", 170, 600, 30);
      Enter(650, 750);
      break;
    case 10:
      freeChat(170, 600);
      image(yusha, 90, 700, 200, 200);
      freeText("禁術コマンド...", "breakの[b]キー...", 170, 600, 30);
      Enter(650, 750);
      break;
    case 11:
      freeChat(170, 600);
      image(yusha, 90, 700, 200, 200);
      freeText("ああw気にしないでw", "こっちの話だよ", 170, 600, 30);
      Enter(650, 750);
      break;
    case 12:
      freeChat(170, 600);
      image(yusha, 90, 700, 200, 200);
      freeText("んじゃこの世界の真の王は", "次は君ってことで。よろしく", 170, 600, 30);
      Enter(650, 750);
      break;
    case 13:
      freeChat(170, 600);
      image(yusha, 90, 700, 200, 200);
      freeText("そして、おめでとう。", "", 170, 650, 50);
      Enter(650, 750);
      break;
    case 44:
      freeChat(170, 600);
      image(yusha, 90, 700, 200, 200);
      freeText("やあ、初めまして...だよね？", "一つ気になることがあるんだけど", 170, 600, 30);
      Enter(650, 750);
      break;
    case 45:
      freeChat(170, 600);
      image(yusha, 90, 700, 200, 200);
      freeText("なんで君饅頭持ってるの?", "", 170, 650, 50);
      Enter(650, 750);
      break;
    case 46:
      freeChat(170, 600);
      image(yusha, 90, 700, 200, 200);
      freeText("門番にはあの傲慢なゴブリンがいるから", "持ってるはずがないんだけど...", 170, 600, 30);
      Enter(650, 750);
      break;
    case 47:
      freeChat(170, 600);
      image(yusha, 90, 700, 200, 200);
      freeText("その顔は...強行突破してきたか...", "なら僕も応戦しよう。", 170, 600, 30);
      Enter(650, 750);
      //image(tate, width/2+30, 250);
      break;
    case 48:
      freeChat(170, 600);
      image(yusha, 90, 700, 200, 200);
      freeText("こんなやつに負けるわけもないけど", "念には念を。本気でやるよ。", 170, 600, 30);
      Enter(650, 750);
      image(tate, 90+30, 740, 110, 110);
      break;
    case 49:
      encount+= 2;
      fill(0);
      noStroke();
      for (int i = 0; i < 10; i++) {
        rect(-70*i, 45+90*i, encount*10, 90);
        if (encount == 350) {
          charaMove = false;
          storyTarn = 50;
        }
      }
      break;
    case 50:
      battleStory(9);
      stage = 9;
      encount = 0;
      break;
    case 51:
      freeChat(170, 600);
      freeText("そして誰もいなくなった...", "", 170, 650, 50);
      Enter(650, 750);
      break;
    }
    menu();
    break;
  case 100://GAMEOVER (STORY)
    iWanna.play();
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
    textSize(20);
    text("[矢印キーかAorDキーで選択]", width/2, 700);
    fill(0, 255, 0);

    if (messageCount % 60 <= 40) {
      text("ENTERキーで決定", 750, 800);
    }

    break;//GAMEOVER
  case 1000:
    background(0);
    stroke(255);
    line(0, 300, 900, 300);
    line(0, 600, 900, 600);
    line(300, 0, 300, 900);
    //セーブテキスト
    fill(0, 255, 0);
    if (jarray[0].getInt(0) == 0) {
      textSize(80);
      text("冒険の書:1", 600, 130);
    } else {
      textSize(30);
      switch(jarray[0].getInt(0)) {
      case 11:
        text("いる場所:草原", 600, 100);
        break;
      case 12:
        text("いる場所:図書館", 600, 100);
        break;
      case 13:
        text("いる場所:マヨイのサバク", 600, 100);
        break;
      case 14:
        text("いる場所:ダンジョンみたいなやつ", 600, 100);
        break;
      case 15:
        text("いる場所:ダンジョンの奥", 600, 100);
        break;
      case 16:
        text("決戦", 600, 100);
        break;
      }
      image(suraimu, 670, 170, 100, 100);
      textSize(45);
      text("level:"+chara.level, 500, 175);
    }
    if (jarray[1].getInt(0) == 0) {
      textSize(80);
      text("冒険の書:2", 600, 430);
    } else {
      textSize(30);
      switch(jarray[1].getInt(0)) {
      case 11:
        text("いる場所:草原", 600, 400);
        break;
      case 12:
        text("いる場所:図書館", 600, 400);
        break;
      case 13:
        text("いる場所:マヨイのサバク", 600, 400);
        break;
      case 14:
        text("いる場所:ダンジョンみたいなやつ", 600, 400);
        break;
      case 15:
        text("いる場所:ダンジョンの奥", 600, 400);
        break;
      case 16:
        text("決戦", 600, 400);
        break;
      }
      image(suraimu, 670, 470, 100, 100);
      textSize(45);
      text("level:"+chara.level, 500, 475);
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
        text("いる場所:ダンジョンみたいなやつ", 600, 700);
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
    //セーブテキスト

    fill(0);
    if (choose == 0) {
      triangle(100, 50, 100, 250, 200, 150);
    } else if (choose == 1) {
      triangle(100, 350, 100, 550, 200, 450);
    } else if (choose == 2) {
      triangle(100, 650, 100, 850, 200, 750);
    }
    break;
  case 4444:
    megalovania.play();
    background(0);
    textSize(20);
    fill(255, 0, 0);
    textSize(50);
    text("GAME CLEAR...", width/2, 500);
    text("BAD END[殺戮者]", width/2, 300);
    textSize(40);
    text("プレイしてくれてありがとうございます。", width/2, 700);

    textSize(20);
    text("お借りした楽曲:Megalovania", 600, 850);
    break;
  case 10000:
    last.close();
    sentou2.play();
    background(0);
    textSize(20);
    fill(0, 255, 0);
    textSize(50);
    text("GAME CLEAR!!", width/2, 500);
    text("プレイしてくれてありがとう!!", width/2, 700);
    text("TRUE END[真の王]", width/2, 300);
    break;
  }
}

void stop() {
  sentou.close();
  last.close();
  minim.stop();
  super.stop();
}
void gameInit() {

  for (int i = 0; i < 11; i++) {
    enemy[i].hp = 10;
    enemy[i].tarn = 0;
  }
  if (stage == 9) {
    enemy[9].random = 3;
  }
  bgmCount = 0;
  obakeMove = 0;
  tateHP = 1;
  kinokoMove = 2;
  charge = 0;
  time = 0;
  myHP = 10;
  battleTarn = 0;
}

void battle() {
  if (battleTarn == 0) {
    playerChoice();
  }
}
void playerChoice() {
  if (choose == 0) {
    fill(#FFA703);
    if (messageCount % 60 <= 45) {
      strokeWeight(0);
      rect(175, 600, 235, 300);
    }
    strokeWeight(10);
    triangle(130, 850, 220, 850, 175, 800);
    text("溜める", 180, 600);
    fill(255);
    text("守る", 430, 600);
    text("ハー!!", 710, 600);
  } else if (choose == 1) {
    fill(#86DAFF);
    if (messageCount % 60 <= 45) {
      strokeWeight(0);
      rect(435, 600, 255, 300);
    }
    strokeWeight(10);
    triangle(380, 850, 470, 850, 425, 800);
    text("守る", 430, 600);
    fill(255);
    text("溜める", 180, 600);
    text("ハー!!", 710, 600);
  } else if (choose == 2) {
    fill(255, 69, 0);
    if (messageCount % 60 <= 45) {
      strokeWeight(0);
      rect(710, 600, 265, 300);
    }
    strokeWeight(10);
    triangle(660, 850, 750, 850, 705, 800);
    text("ハー!!", 710, 600);
    fill(255);
    text("溜める", 180, 600);
    text("守る", 430, 600);
  }
  fill(255);
  strokeWeight(20);
  line(300, 450, 300, 750);
  line(570, 450, 570, 750);
}

void egg(float x, float y, float scale, boolean eye) {
  strokeWeight(2);
  stroke(0);
  fill(255);
  pushMatrix();
  translate(900-(900-scale*10), 900-(900-scale*10));
  scale(scale);
  ellipse(x, y, 200, 200);
  line(x-100, y+5, x-70, y-30);
  line(x-70, y-30, x-40, y+5);
  line(x-40, y+5, x-10, y-30);
  line(x-10, y-30, x+20, y+5);
  line(x+20, y+5, x+50, y-30);
  line(x+50, y-30, x+80, y+5);
  line(x+80, y+5, x+95, y-21.4285);
  if (eye == true) {
    line(x-45, y+20, x-45, y+50);//左目
    line(x+45, y+20, x+45, y+50);//右目
  } else if (eye == false) {
    line(x-35, y+20, x-60, y+50);//左目
    line(x+35, y+20, x+60, y+50);//右目
  }
  bezier(x-25, y+45, x-20, y+65, x-10, y+65, x, y+45);
  bezier(x, y+45, x+10, y+65, x+20, y+65, x+25, y+45);
  popMatrix();
}

void danjonHit(int number) {
  switch(number) {
  case 0://ダンジョン最初の当たり判定
    //右の速度
    if ((chara.x == 510 && chara.y >= 20 && chara.y <= 40)||//入り口右
      (chara.x == 470 && (chara.y <= 110 && chara.y >= 50))) {//ちょっと出たとこ
      vD = 0;
    } else vD = 10;
    //右の速度

    //左の速度
    if (chara.x == 340 && chara.y >= 20 && chara.y <= 40) {//入り口左
      vA = 0;
    } else vA = 10;
    //左の速度

    //下の速度
    if ((chara.y == 40 && ((chara.x >= 480 && chara.x <= 510)|| (chara.x <= 370 && chara.x >= 330)))) {//入り口右と左の出っ張りした
      vS = 0;
    } else vS = 10;
    //下の速度

    //上の速度
    if ((chara.y == 120 && ((chara.x >= 480 && chara.x <= 700)||(chara.x <= 370 && chara.x >= 110)))) {
      vW = 0;
    } else vW = 10;
    //上の速度

    break;
  case 1:
    break;
  }

  switch(stoneMove) {
  case 0:
    if (suraimuMove == true) {
      if (chara.y == 40 && ((chara.x >= 480 && chara.x <= 510)|| (chara.x <= 370 && chara.x >= 330))||
        (chara.y == 340 && chara.x >=650 && chara.x <=700)||
        (chara.y == 750 && chara.x >= 380 && chara.x <= 430)||
        (chara.y == 270 && chara.x >= 110 && chara.x <= 160)||
        (chara.y == 550 && chara.x >= 70 && chara.x <= 130)||
        (chara.y == 220 && chara.x >= 170 && chara.x <=640)) {
        vS = 0;
      } else vS = 10;
    } else if (suraimuMove == false) {
      if (chara.y == 40 && ((chara.x >= 480 && chara.x <= 520)|| (chara.x <= 370 && chara.x >= 330))||
        (chara.y == 340 && chara.x >=650 && chara.x <=700)||
        (chara.y == 750 && chara.x >= 380 && chara.x <= 430)||
        (chara.y == 550 && chara.x >= 70 && chara.x <= 130)||
        (chara.y == 220 && chara.x >= 170 && chara.x <=640)) {
        vS = 0;
      } else vS = 10;
    }
    if ((chara.x == 380 && (chara.y <= 110 && chara.y >= 50))||(chara.x == 340 && chara.y <= 40 && chara.y >= 30)||
      (chara.x == 140 && chara.y >= 560 && chara.y <= 610)) {
      vA = 0;
    } else vA = 10;

    if ((chara.y == 120 && ((chara.x >= 480 && chara.x <= 700)||(chara.x <= 370 && chara.x >= 110)))||
      (chara.y == 620 && chara.x >= 70 && chara.x <= 130)) {
      vW = 0;
    } else vW = 10;

    if ((chara.x == 470 && (chara.y <= 110 && chara.y >= 50))||(chara.x == 510 && chara.y == 40)||
      (chara.x == 700 && chara.y <= 340 && chara.y >= 120)||
      (chara.x == 530 && chara.y >= 360 && chara.y <=460)||
      (chara.x == 60 && chara.y >= 560 && chara.y <= 610)) {
      vD = 0;
    } else vD = 10;
    image(stone, 650, 410, 230, 230);
    break;
  case 1:
    if (danjonMove == 0) {
      if ((chara.y == 40 && ((chara.x >= 470 && chara.x <= 520)|| (chara.x <= 370 && chara.x >= 330)))||
        (chara.y == 750 && chara.x >= 380 && chara.x <= 430)||
        (chara.y == 550 && chara.x >= 70 && chara.x <= 130)) {
        vS = 0;
      } else vS = 10;
    } else if (danjonMove == 1) {
      if (chara.y == 40 && ((chara.x >= 470 && chara.x <= 520)|| (chara.x <= 370 && chara.x >= 330))) {
        vS = 0;
      } else vS = 10;
    }
    if ((chara.x == 380 && (chara.y <= 110 && chara.y >= 50))||(chara.x == 340 && chara.y <= 40 && chara.y >= 30)||
      (chara.x == 140 && chara.y >= 560 && chara.y <= 610)) {
      vA = 0;
    } else vA = 10;

    if ((chara.y == 120 && ((chara.x >= 480 && chara.x <= 700)||(chara.x <= 370 && chara.x >= 110)))||
      (chara.y == 620 && chara.x >= 70 && chara.x <= 130)) {
      vW = 0;
    } else vW = 10;

    if ((chara.x == 470 && (chara.y <= 110 && chara.y >= 50))||(chara.x == 510 && chara.y == 40)||
      (chara.x == 700 && chara.y <= 340 && chara.y >= 120)||(chara.x == 60 && chara.y >= 560 && chara.y <= 610)) {
      vD = 0;
    } else vD = 10;
    break;
  }
}
