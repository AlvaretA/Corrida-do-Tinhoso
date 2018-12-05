/* CORRIDA DO TINHOSO™ ©JUNTO & MISTURADO 2018
 SOURCE CODE*/

//Mecânicas do jogador.

boolean left=false, right=false, up=false, down=false;
int px=375, py=100;
int vel=10;
float health=198;
final int SHOTSFIRED=3;
int [] tiroX= new int [SHOTSFIRED], tiroY= new int [SHOTSFIRED];
boolean [] shotVisible= new boolean [SHOTSFIRED];
int animStartX=0, animStartY=0;
int frameCounterSino=0;
boolean sino=false;
boolean shotsFired=false, shotsFiredOnce=true;

void playerAnimation() {
  if (!shotsFired) {
    animStartX += 278;
    if (animStartX >= 5004) {
      animStartX = 0;
    }
  }
  if (shotsFired) {
    if (shotsFiredOnce) {
      shot.play();
      animStartX=0;
      shotsFiredOnce=false;
    }
    animStartX+=278;
    if (animStartX>=12510) {
      shotsFired=false;
    }
  }
}

void tiro() {
  for (int i=0; i < shotVisible.length; i++) {
    shotVisible[i] = false;
  }
}

void shotsFired() {
  for (int i =0; i < shotVisible.length; i++) {
    if (shotVisible[i] == true) {
      image(bullet, tiroX[i], tiroY[i]);
      tiroY[i]-=10;
      shot.rewind();
      shot.play();
      if (tiroY[i] < 0) {
        shotVisible[i] = false;
      }
    }
  }
}

void sino() {
  if (scoreInGame > 200) {
    image(bell, 50, 85);
    if (sino) {
      if (frameCounterSino <=150) {
        frameCounterSino++;
        sce_y= sce_y-8;
      } else {
        frameCounterSino=0;
        sino=false;
      }
    }
  }
}

void stamina() {
  image(staminabar, 351, 51, health, 49);
  image(stamina, 250, 0);
  if (health >= 198)
    health=198;
}

void keyPressed() {
  if (key=='D'||key=='d'||keyCode==RIGHT) {
    right=true;
  }
  if (key=='A'||key=='a'||keyCode==LEFT) {
    left=true;
  }
  if (key=='W'||key=='w'||keyCode==UP) {
    up=true;
  }
  if (key=='S'||key=='s'||keyCode==DOWN) {
    down=true;
  }
  if (key=='Z'||key=='z') {
    if (scoreInGame >=200){
      if (frameCounterSino ==0) {
      sino=true;
      scoreInGame=scoreInGame-200;
      belli.rewind();
      belli.play();
      }
    }
  }
  if (key=='+') {
    scoreInGame+=1000;
  }
  if (key=='-') {
    health=198;
  }
  if (key=='*') {
    health=1;
  }

  if (leRetryMenu.isVisible) {
    if (scoreInGame==scoreData[0]) {
      if (isScore==0) {
        scoreNameData[0][0]=key;
        isScore=1;
      } else {
        if (isScore==1) {
          scoreNameData[0][1]=key;
          isScore=2;
        } else {
          if (isScore==2) {
            scoreNameData[0][2]=key;
            isScore=3;
          }
        }
      }
    }
    if (scoreInGame == scoreData[1]) {
      if (isScore==0) {
        scoreNameData[1][0]=key;
        isScore=1;
      } else {
        if (isScore==1) {
          scoreNameData[1][1]=key;
          isScore=2;
        } else {
          if (isScore==2) {
            scoreNameData[1][2]=key;
            isScore=3;
          }
        }
      }
    }
    if (scoreInGame == scoreData[2]) {
      if (isScore==0) {
        scoreNameData[2][0]=key;
        isScore=1;
      } else {
        if (isScore==1) {
          scoreNameData[2][1]=key;
          isScore=2;
        } else {
          if (isScore==2) {
            scoreNameData[2][2]=key;
            isScore=3;
          }
        }
      }
    }
  } else {
    isScore=0;
  }

  for (int i = 0; i < shotVisible.length; i++) {
    if (key == ' ' && shotVisible[i] == false) {
      shotsFired=true;
      shotVisible[i] = true;
      tiroX[i] = px + 40;
      tiroY[i] = py + 40;
      break;
    }
  }
}

void keyReleased() {
  if (key=='D'||key=='d'||keyCode==RIGHT) {
    right=false;
  }
  if (key=='A'||key=='a'||keyCode==LEFT) {
    left=false;
  }
  if (key=='W'||key=='w'||keyCode==UP) {
    up=false;
  }
  if (key=='S'||key=='s'||keyCode==DOWN) {
    down=false;
  }
}
void movePlayer() {
  //Movimento do Jogador
  if (right==true) {
    px+=vel;
  }
  if (left==true) {
    px-=vel;
  }
  if (up==true) {
    py-=vel;
  }
  if (down==true) {
    py+=vel;
  }

  //Colisoes com as bordas

  if (px>width - 61) {
    px=px-vel;
  }
  if (px<0) {
    px=px+vel;
  }
  if (py<0) {
    py=py+vel;
  } else {
    if (py > height - 167) {
      py=py-vel;
    }
  }
}