void howToPlay() {
  switch(storyTarn) {
  case 0:
    freeText("遊び方ページへようこそ!", "僕はたまご!ルールを説明するね!", 250, 70, 35);
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
  freeText("じゃ次にモードの説明だよ","このゲームには",250,50,35);
    break;
    case 11:
    freeText("STORYモードとARCADEモードが","あるんだけど",250,50,35);
    image(screen[5], width/2, 570);
    break;
    case 12:
    freeText("STORYモードではRPGと戦闘が","楽しめて、",250,50,35);
    image(screen[6],width/2,570);
    break;
    case 13:
    freeText("ARCADEモードは","10体の敵と戦うモードで",250,50,35);
    image(screen[7],width/2,570);
    break;
    case 14:
    freeText("個性豊かな敵が10体もいるから","存分に楽しめると思うよ",250,50,30);
    break;
    case 15:
    freeText("あ、そうそう。","ここで耳寄りな情報なんだけど",250,50,35);
    
    break;
    case 16:
    freeText("ほとんど相手の動きには","決まりがあるから",250,50,35);
    break;
    case 17:
    freeText("それを見極めれたら","楽に勝てるかもしれないね",250,50,35);
    break;
    case 18:
    freeText("話が長くなったけどここでおしまい。","もう一回モードについて聞く？",250,50,35);
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
    case 19:
    freeText("じゃ楽しんで！","",250,50,80);
    break;
  }
}
