/* CORRIDA DO TINHOSO™ ©JUNTO & MISTURADO 2018
 SOURCE CODE*/

//InGame

class inGame {
  boolean isInGame, showScore;
  boolean isAnimVisible;


  inGame() {
    isInGame = false;
    showScore = false;
    isAnimVisible=false;
  }

  void inGames() {
    if (isInGame) {
      if (start.time() > 25.5) {
        start.stop();
        isAnimVisible=true;
      }
      if (!isAnimVisible) {
        image(start, 0, 0, 800, 600);
        start.loop();
        image(skip, 100, 533);
        if (mouseX>= 100 && mouseX<= 200 && mouseY>= 533 && mouseX<= 567){
          image(skipHover, 100, 533);
          if (mousePressed) {
            isAnimVisible=true;
            start.stop();
          }
        }
      } else {
        pcol=new colisao((int)px, (int)py, 61, 167);
        sceneryType();
        image(bg, 0, 0);
        image(str, 0, sce_y+800);
        image(div_str, 0, sce_y+800-1135);
        image(div_mid, 0, sce_y+800-(1135*2));
        image(div_mid, 0, sce_y+800-(1135*3));
        image(div_end, 0, sce_y+800-(1135*4));
        image(str, 0, sce_y+800-(1135*5));
        if (sce_y>=4540) {
          sce_y=-1135;
        }
        playerAnimation();
        if (shotsFired) {
          player=playertiro;
          image(player.get(animStartX, animStartY, 278, 565), px, py, 70, 167);
        } else {
          player=playernominal;
          image(player.get(animStartX, animStartY, 278, 576), px, py, 70, 167);
        }
        /*if (sino) {
         player=playersino;
         image(player.get(animStartX, animStartY, 284, 565), px, py, 70, 167);
         } else {
         player=playernominal;
         image(player.get(animStartX, animStartY, 278, 576), px, py, 70, 167);
         }*/
        //image(player, px, py);
        stamina();
        esq_str_str.limits();
        dir_str_str.limits();
        esq_str_end.limits();
        dir_str_end.limits();
        mid_div_str.limits();
        esq_div_str.limits();
        dir_div_str.limits();
        mid_div_mid.limits();
        esq_div_end.limits();
        dir_div_end.limits();
        mid_div_end.limits();
        esq_str_str.limits();
        esq_str_str.move();
        dir_str_str.move();
        esq_str_end.move();
        dir_str_end.move();
        mid_div_str.move();
        esq_div_str.move();
        dir_div_str.move();
        mid_div_mid.move();
        esq_div_end.move();
        dir_div_end.move();
        mid_div_end.move();
        esq_str_str.move();
        movePlayer();
        pcol.limits();
        shotsFired();
        health-=0.25;
        obstaculos();
        fogo();
        kpt();
        everson();
        xEnemies();
        asinha();
        sino();
        maca();
        if (scoreInGame < 50) {
          image(tutorial, 600, 0);
        }
        if (health<=0) {
          cty.pause();
          des.pause();
          hel.pause();
          inGame.isInGame=false;
          leMenu.isVisible=false;
          leRetryMenu.isVisible=true;
          scoreSystem();
          health=198;
          sce_y=-1135;
          px=375;
          py=100;
          vel=10;
          cidade=false;
          deserto=false;
          inferno=false;
          isAnimVisible=false;
        }

        if (pcol.qy < esq_str_str.qy+esq_str_str.qty && pcol.qy + pcol.qty > esq_str_str.qy) {
          if (pcol.qx < esq_str_str.qx+esq_str_str.qtx && pcol.qx + pcol.qtx > esq_str_str.qx) {
            if (dist(esq_str_str.qx, 100, pcol.qx + 61, 100) < dist(esq_str_str.qx + esq_str_str.qtx, 100, pcol.qx, 100)) {
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

        if (pcol.qy < dir_str_str.qy+dir_str_str.qty && pcol.qy + pcol.qty > dir_str_str.qy) {
          if (pcol.qx < dir_str_str.qx+dir_str_str.qtx && pcol.qx + pcol.qtx > dir_str_str.qx) {
            if (dist(dir_str_str.qx, 100, pcol.qx + 61, 100) < dist(dir_str_str.qx + dir_str_str.qtx, 100, pcol.qx, 100)) {
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

        if (pcol.qy < esq_str_end.qy+esq_str_end.qty && pcol.qy + pcol.qty > esq_str_end.qy) {
          if (pcol.qx < esq_str_end.qx+esq_str_end.qtx && pcol.qx + pcol.qtx > esq_str_end.qx) {
            if (dist(esq_str_end.qx, 100, pcol.qx + 61, 100) < dist(esq_str_end.qx + esq_str_end.qtx, 100, pcol.qx, 100)) {
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

        if (pcol.qy < mid_div_str.qy+mid_div_str.qty && pcol.qy + pcol.qty > mid_div_str.qy) {
          if (pcol.qx < mid_div_str.qx+mid_div_str.qtx && pcol.qx + pcol.qtx > mid_div_str.qx) {
            if (dist(mid_div_str.qx, 100, pcol.qx + 61, 100) < dist(mid_div_str.qx + mid_div_str.qtx, 100, pcol.qx, 100)) {
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

        if (pcol.qy < esq_div_str.qy+esq_div_str.qty && pcol.qy + pcol.qty > esq_div_str.qy) {
          if (pcol.qx < esq_div_str.qx+esq_div_str.qtx && pcol.qx + pcol.qtx > esq_div_str.qx) {
            if (dist(esq_div_str.qx, 100, pcol.qx + 61, 100) < dist(esq_div_str.qx + esq_div_str.qtx, 100, pcol.qx, 100)) {
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

        if (pcol.qy < dir_div_str.qy+dir_div_str.qty && pcol.qy + pcol.qty > dir_div_str.qy) {
          if (pcol.qx < dir_div_str.qx+dir_div_str.qtx && pcol.qx + pcol.qtx > dir_div_str.qx) {
            if (dist(dir_div_str.qx, 100, pcol.qx + 61, 100) < dist(dir_div_str.qx + dir_div_str.qtx, 100, pcol.qx, 100)) {
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

        if (pcol.qy < mid_div_mid.qy+mid_div_mid.qty && pcol.qy + pcol.qty > mid_div_mid.qy) {
          if (pcol.qx < mid_div_mid.qx+mid_div_mid.qtx && pcol.qx + pcol.qtx > mid_div_mid.qx) {
            if (dist(mid_div_mid.qx, 100, pcol.qx + 61, 100) < dist(mid_div_mid.qx + mid_div_mid.qtx, 100, pcol.qx, 100)) {
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

        if (pcol.qy < esq_div_end.qy+esq_div_end.qty && pcol.qy + pcol.qty > esq_div_end.qy) {
          if (pcol.qx < esq_div_end.qx+esq_div_end.qtx && pcol.qx + pcol.qtx > esq_div_end.qx) {
            if (dist(esq_div_end.qx, 100, pcol.qx + 61, 100) < dist(esq_div_end.qx + esq_div_end.qtx, 100, pcol.qx, 100)) {
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

        if (pcol.qy < dir_div_end.qy+dir_div_end.qty && pcol.qy + pcol.qty > dir_div_end.qy) {
          if (pcol.qx < dir_div_end.qx+dir_div_end.qtx && pcol.qx + pcol.qtx > dir_div_end.qx) {
            if (dist(dir_div_end.qx, 100, pcol.qx + 61, 100) < dist(dir_div_end.qx + dir_div_end.qtx, 100, pcol.qx, 100)) {
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

        if (pcol.qy < mid_div_end.qy+mid_div_end.qty && pcol.qy + pcol.qty > mid_div_end.qy) {
          if (pcol.qx < mid_div_end.qx+mid_div_end.qtx && pcol.qx + pcol.qtx > mid_div_end.qx) {
            if (dist(mid_div_end.qx, 100, pcol.qx + 61, 100) < dist(mid_div_end.qx + mid_div_end.qtx, 100, pcol.qx, 100)) {
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

        if (pcol.qy < esq_str_str.qy+esq_str_str.qty && pcol.qy + pcol.qty > esq_str_str.qy) {
          if (pcol.qx < esq_str_str.qx+esq_str_str.qtx && pcol.qx + pcol.qtx > esq_str_str.qx) {
            if (dist(esq_str_str.qx, 100, pcol.qx + 61, 100) < dist(esq_str_str.qx + esq_str_str.qtx, 100, pcol.qx, 100)) {
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

        if (showScore) {
          fill(153, 0, 0);
          text(scoreInGame, 50, 75);
        }
      }
    }
  }
}

void movieEvent(Movie m) {
  m.read();
}