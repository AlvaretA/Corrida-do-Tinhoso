/* CORRIDA DO TINHOSO™ ©JUNTO & MISTURADO 2018
 SOURCE CODE*/

// Inimigos

colisao preda;
colisao preda2;
colisao fire;
colisao tre1;
colisao tre2;

int [] tgtX, tgtY;
boolean [] tgtVisible;
int MAXENEMIES = 3;
float tgtAnimStartX=0;
boolean tgtFirstTime=false;

void xEnemies() {
  if (deserto || inferno) {
    if (!tgtFirstTime) {
      tgtX = new int [MAXENEMIES];
      tgtY = new int [MAXENEMIES];
      tgtVisible = new boolean [MAXENEMIES];
      tgtFirstTime = true;
    }
    for (int i = 0; i < tgtVisible.length; i++) {
      if (tgtVisible[i] == false) {
        tgtVisible[i] = true;
        tgtX[i] = (int)random(150, 650);
        tgtY[i] = (int)random(-5175, -500);
      } else {
        tgtAnimStartX+=62.42;
        if (tgtAnimStartX>=749) {
          tgtAnimStartX=0;
        }
        image(tgt.get((int)tgtAnimStartX, 0, 62, 110), tgtX[i], tgtY[i], 62.42, 110);
        if (cidade);
        tgtY[i]=tgtY[i]+5;
        if (deserto);
        tgtY[i]=tgtY[i]+5;
        if (inferno);
        tgtY[i]=tgtY[i]+5;
        if (tgtY[i] >600) {
          tgtVisible[i]=false;
        }
      }
      for (int j=0; j < tgtVisible.length; j++) {
        if (tgtVisible[j]==true) {
          for (int f = 0; f < shotVisible.length; f++) {
            if (dist(tgtX[j], tgtY[j], tiroX[f], tiroY[f]) <= 62) {
              shotVisible[f]=false;
              tgtVisible[j]=false;
              scoreInGame=scoreInGame+10;
            }
            if (dist(tgtX[j], tgtY[j], (int)pcol.qx, (int)pcol.qy) <= 62) {
              health-=0.25;
              DAMAGESOUND();
            }
          }
        }
      }
    }
  }
}

int [] eversonX, eversonY;
boolean [] eversonVisible;
boolean eversonFirstTime=false;
int eversonAnimStartX=0;

void everson() {
  if (cidade || deserto || inferno) {
    if (!eversonFirstTime) {
      eversonX = new int [MAXENEMIES];
      eversonY = new int [MAXENEMIES];
      eversonVisible = new boolean [MAXENEMIES];
      eversonFirstTime = true;
    }
    for (int i = 0; i < eversonVisible.length; i++) {
      if (eversonVisible[i] == false) {
        eversonVisible[i] = true;
        eversonX[i] = (int)random(0, 750);
        eversonY[i] = (int)random(-5175, -500);
      } else {
        image(everson.get(eversonAnimStartX, 0, 100, 45), eversonX[i], eversonY[i], 100, 45);
        if (cidade) {
          eversonY[i]+=8;
        }
        if (deserto) {
          eversonY[i]+=10;
        }
        if (inferno) {
          eversonY[i]+=12;
        }
        if (dist(eversonX[i]+100, eversonY[i], px, py) <= 150 && eversonY[i] >= py-50 && eversonY[i] <= py+50) {
          eversonAnimStartX+=100;
          if (eversonAnimStartX >= 1800) {
            eversonAnimStartX=0;
          }
          if (cidade) {
            eversonX[i]+=15;
          }
          if (deserto) {
            eversonX[i]+=15;
          }
          if (inferno) {
            eversonX[i]+=15;
          }
        } else {
          if (dist(eversonX[i], eversonY[i], px+ 61, py) <= 300 && eversonY[i] >= py-150 && eversonY[i] <= py+300) {
            eversonAnimStartX-=100;
            if (eversonAnimStartX <= 0) {
              eversonAnimStartX=1800;
            }
            if (cidade) {
              eversonX[i]-=15;
            }
            if (deserto) {
              eversonX[i]-=15;
            }
            if (inferno) {
              eversonX[i]-=15;
            }
          }
        }
        if (eversonX[i] > 600 || eversonX[i] < 0) {
          eversonVisible[i]=false;
        }
        if (eversonY[i] > 800) {
          eversonVisible[i]=false;
        }
        for (int j=0; j < eversonVisible.length; j++) {
          if (eversonVisible[j]==true) {
            for (int f = 0; f < shotVisible.length; f++) {
              if (dist(eversonX[j], eversonY[j], tiroX[f], tiroY[f]) <= 100) {
                shotVisible[f]=false;
                eversonVisible[j]=false;
                scoreInGame=scoreInGame+10;
              }
              if (dist(eversonX[j], eversonY[j], (int)pcol.qx, (int)pcol.qy) <= 45) {
                health-=0.25;
                DAMAGESOUND();
              }
            }
          }
        }
      }
    }
  }
}

void obstaculos() {
  preda = new colisao (400, sce_y+500, 50, 40);
  image(pedra, 400, sce_y+500, 50, 40);
  if (pcol.qy < preda.qy+preda.qty && pcol.qy + pcol.qty > preda.qy) {
    if (pcol.qx < preda.qx+preda.qtx && pcol.qx + pcol.qtx > preda.qx) {
      if (dist(preda.qx, 100, pcol.qx + 61, 100) < dist(preda.qx + preda.qtx, 100, pcol.qx, 100)) {
        px=px-vel;
        health-=0.3;
        DAMAGESOUND2();
      } else {
        px=px+vel;
        health-=0.3;
        DAMAGESOUND2();
      }
    }
  }
  preda2=new colisao (400, sce_y-4000, 50, 40);
  image (pedra2, 400, sce_y-4000, 50, 40);
  if (pcol.qy < preda2.qy+preda2.qty && pcol.qy + pcol.qty > preda2.qy) {
    if (pcol.qx < preda2.qx+preda2.qtx && pcol.qx + pcol.qtx > preda2.qx) {
      if (dist(preda2.qx, 100, pcol.qx + 61, 100) < dist(preda2.qx + preda2.qtx, 100, pcol.qx, 100)) {
        px=px-vel;
        health-=0.3;
        DAMAGESOUND2();
      } else {
        px=px+vel;
        health-=0.3;
        DAMAGESOUND2();
      }
    }
  }
  tre1 = new colisao (500, sce_y-1000, 100, 57);
  image(tree1, 500, sce_y-1000, 100, 57);
  if (pcol.qy < tre1.qy+tre1.qty && pcol.qy + pcol.qty > tre1.qy) {
    if (pcol.qx < tre1.qx+tre1.qtx && pcol.qx + pcol.qtx > tre1.qx) {
      if (dist(tre1.qx, 100, pcol.qx + 61, 100) < dist(tre1.qx + tre1.qtx, 100, pcol.qx, 100)) {
        px=px-vel;
        health-=0.3;
        DAMAGESOUND2();
      } else {
        px=px+vel;
        health-=0.3;
        DAMAGESOUND2();
      }
    }
  }
  /*tre2 = new colisao (450, sce_y+1000, 110, 110);
   image(maca, 450, sce_y+1000, 50, 50);
   if (pcol.qy < tre2.qy+tre2.qty && pcol.qy + pcol.qty > tre2.qy) {
   if (pcol.qx < tre2.qx+tre2.qtx && pcol.qx + pcol.qtx > tre2.qx) {
   if (dist(tre2.qx, 100, pcol.qx, 100) > dist(tre2.qx, 100, pcol.qx, 100)) {
   health+=10;
   } else {
   health+=10;
   }
   }
   }*/
}

int asinhaX=0, asinhaY=0;
boolean asinhaVisible;
int asinhaAnimStartX=3600;

void asinha() {
  if (inferno) {
    if (asinhaVisible == false) {
      asinhaVisible = true;
      asinhaX = 800;
      asinhaY = (int)random(py, py);
    } else {
      image(asinha.get(0, asinhaAnimStartX, 82, 200), asinhaX, asinhaY, 82, 200);
      asinhaX-=10;
      asinhaAnimStartX-=200;
      if (asinhaAnimStartX <= 0) {
        asinhaAnimStartX=3400;
        if (inferno) {
          asinhaVisible=true;
          asinhaY=asinhaY+6;
        }
        if (asinhaX < 0) {
          asinhaVisible=false;
        }
      }

      if (asinhaVisible==true) {
        if (dist(asinhaX, asinhaY, (int)pcol.qx, (int)pcol.qy) <= 61) {
          health-=0.25;
          DAMAGESOUND();
        }
      }
    }
  }
}

int kptX, kptY;
boolean kptVisible;
float kptAnimStartX=0;
float alpha=0;

void kpt() {
  if (cidade || deserto || inferno) {
    if (kptVisible == false) {
      kptVisible = true;
      kptX = (int)random(150, 650);
      kptY = (int)random(0, 400);
    } else {
      kptAnimStartX+=100;
      if (kptAnimStartX>=749) {
        kptAnimStartX=0;
      }
      image(kpt.get((int)kptAnimStartX, 0, 100, 63), kptX, kptY, 100, 63);
    }
    if (kptVisible==true) {
      for (int f = 0; f < shotVisible.length; f++) {
        if (dist(kptX, kptY, tiroX[f], tiroY[f]) <= 100) {
          shotVisible[f]=false;
          kptVisible=false;
          scoreInGame=scoreInGame+10;
          fogo();
        }
        if (dist(kptX, kptY, (int)pcol.qx, (int)pcol.qy) <= 61) {
          health-=0.25;
          DAMAGESOUND();
        }
      }
    }
  }
}

int fogoX, fogoY;

void fogo() {
  fire = new colisao (fogoX, fogoY, 100, 62);
  if (kptVisible==false) {
    fogoX=kptX;
    fogoY=kptY;
    image(fogo, fogoX, fogoY);
  } else {
    image(fogo, fogoX, fogoY);
    if (cidade) {
      fogoY+=8;
    }
    if (deserto) {
      fogoY+=10;
    }
    if (inferno) {
      fogoY+=12;
    }
    if (dist(fogoX, fogoY, (int)pcol.qx, (int)pcol.qy) <= 61) {
      health-=0.3;
      DAMAGESOUND();
    }
  }
}

colisao macaco[];
int macaY[];
int macaX[];
int MAXAPPLES = 6;
boolean macacoFirst=true, macacoVisible[];

void maca() {
  if (macacoFirst) {
    for (int j=0; j < MAXAPPLES; j++) {
      macaco=new colisao [MAXAPPLES];
      macaY = new int [MAXAPPLES];
      macaX = new int [MAXAPPLES];
      macacoVisible = new boolean [MAXAPPLES];
    }
  }
  for (int i=0; i < macaY.length; i++) {
    if (macacoFirst) {
      macaY[0] = (int)random(sce_y-1135, sce_y+800-1135);
      macaY[1] = sce_y+800-1135+550;
      macaY[2] = (int)random(sce_y+800-(1135*2), sce_y+800-(1135*3));
      macaY[3] = (int)random(sce_y+800-(1135*3), sce_y+800-(1135*4));
      macaY[4] = sce_y+800-(1135*4)+500;
      macaY[5] = (int)random(sce_y+800-(1135*5), sce_y+800-(1135*6));
      //////////////////////////////////////////////////////////
      macaX[0] = (int)random(200, 250);
      macaX[1] = (int)random(550, 600);
      macaX[2] = (int)random(200, 250);
      macaX[3] = (int)random(550, 600);
      macaX[4] = (int)random(200, 250);
      macaX[5] = (int)random(550, 600);
      macacoVisible[i]=true;
      if (!macacoVisible[i]) {
        macacoVisible[i]=true;
      }
    }
    if (macacoVisible[i]) {
      image (maca, macaX[i], macaY[i]);
    }
    macaco[i] = new colisao(macaX[i], macaY[i], 50, 50);
    if (pcol.qy < macaco[i].qy+macaco[i].qty && pcol.qy + pcol.qty > macaco[i].qy) {
      if (pcol.qx < macaco[i].qx+macaco[i].qtx && pcol.qx + pcol.qtx > macaco[i].qx) {
        if (dist(macaco[i].qx, 100, pcol.qx + 61, 100) < dist(macaco[i].qx + macaco[i].qtx, 100, pcol.qx, 100)) {
          health+=5;
          macacoVisible[i]=false;
        } else {
          macacoVisible[i]=true;
        }
      }
    }
    if (i==0) {
      if (macaY[0] >= 4540) {
        macaY[0] = (int)random(sce_y-1135, sce_y+800-1135);
        macacoVisible[i]=true;
      }
    }
    if (i==1) {
      if (macaY[1]>=4540) {
        macaY[1] = sce_y+800-1135+550;
        macacoVisible[i]=true;
      }
    }
    if (i==2) {
      if (macaY[2]>=4540) {
        macaY[2] = (int)random(sce_y+800-(1135*2), sce_y+800-(1135*3));
        macacoVisible[i]=true;
      }
    }
    if (i==3) {
      if (macaY[3]>=4540) {
        macaY[3] = (int)random(sce_y+800-(1135*3), sce_y+800-(1135*4));
        macacoVisible[i]=true;
      }
    }
    if (i==4) {
      if (macaY[4]>=4540) {
        macaY[4] = sce_y+800-(1135*4)+500;
        macacoVisible[i]=true;
      }
    }
    if (i==5) {
      if (macaY[5]>=4540) {
        macaY[5] = (int)random(sce_y+800-(1135*5), sce_y+800-(1135*6));
        macacoVisible[i]=true;
      }
    }
    if (sino) {
      if (cidade) {
        macaY[i]+=0;
      }
      if (deserto) {
        macaY[i]+=10;
      }
      if (inferno) {
        macaY[i]+=22;
      }
    } else {
      if (cidade) {
        macaY[i]+=8;
      }
      if (deserto) {
        macaY[i]+=18;
      }
      if (inferno) {
        macaY[i]+=30;
      }
    }
    macacoFirst=false;
  }
}