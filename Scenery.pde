/* CORRIDA DO TINHOSO™ ©JUNTO & MISTURADO 2018
 SOURCE CODE*/

int sce_y=-1135;

colisao esq_str_end;
colisao dir_str_end;
colisao esq_str_str;
colisao dir_str_str;
colisao esq_div_str;
colisao dir_div_str;
colisao mid_div_str;
colisao mid_div_mid;
colisao esq_div_end;
colisao dir_div_end;
colisao mid_div_end;

PImage str, div_str, div_mid, div_end;
boolean cidade=false, deserto=false, inferno=false;

void sceneryType() {

  if (inGame.isInGame) {
    if (scoreInGame>=0 && cidade==false && deserto==false && inferno==false) {
      cidade=true;
      deserto=false;
      inferno=false;
    }
    if (scoreInGame>300 && deserto==false && inferno==false) {
      cidade=false;
      deserto=true;
      inferno=false;
    }
    if (scoreInGame>800 && inferno==false) {
      cidade=false;
      deserto=false;
      inferno=true;
    }
    if (cidade) {
      str=str_cty;
      div_str=div_cty_str;
      div_mid=div_cty_mid;
      div_end=div_cty_end;
      sce_y=sce_y+8;
    }
    if (deserto) {
      str=str_des;
      div_str=div_des_str;
      div_mid=div_des_mid;
      div_end=div_des_end;
      vel=15;
      sce_y=sce_y+10+8;
    }

    if (inferno) {
      str=str_hel;
      div_str=div_hel_str;
      div_mid=div_hel_mid;
      div_end=div_hel_end;
      vel=20;
      sce_y=sce_y+12+8+10;
    }
  }
}

class colisao {
  float qx, qy, qtx, qty;
  float initY;

  colisao(int qqx, int qqy, int qttx, int qtty) {
    qx=qqx;
    qy=qqy;
    qtx=qttx;
    qty=qtty;
    initY=qqy;
  }
  void limits() {
    fill(255, 255, 255, 1);
    rect(qx, qy, qtx, qty);
    stroke(0, 1);
  }
  void move() {
    qy=sce_y-initY;
  }
}