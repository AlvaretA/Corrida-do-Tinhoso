/* CORRIDA DO TINHOSO™ ©JUNTO & MISTURADO 2018
 SOURCE CODE*/

//MainFirmware
float crash;
colisao pew;
colisao pcol;
mainMenu leMenu;
scoreMenu scoreMenu;
inGame inGame;
retryMenu leRetryMenu;
boolean isAnimVisible=false;

void setup() {
  size(800, 600);
  smooth();
  frameRate(30);
  loadAssets();
  leMenu=new mainMenu();
  scoreMenu = new scoreMenu();
  inGame = new inGame();
  leRetryMenu = new retryMenu();
  handmadeMemories=loadFont(dataPath("universal/gameMenuFont.vlw"));
  textFont(handmadeMemories, 40);
  soundPlacement();
  tiro();
  scoreFiller();

  esq_str_end = new colisao(0, 4870, 150, 1135);
  dir_str_end = new colisao(650, 4870, 150, 1135);
  esq_str_str = new colisao(0, -825, 150, 1135);
  dir_str_str = new colisao(650, -825, 150, 1135);

  //==========RETA=============

  esq_div_str = new colisao(0, -370, 150, 450);
  dir_div_str = new colisao(650, -370, 150, 450);
  mid_div_str= new colisao(300, 400, 200, 600);

  //========DIVSTART===========

  mid_div_mid = new colisao(300, 2597, 200, 1135*2);

  //========DIVMID=============

  esq_div_end = new colisao(0, 3735, 150, 500);
  dir_div_end = new colisao (650, 3735, 150, 500);
  mid_div_end = new colisao (300, 3050, 200, 500);

  // ========DIVEND=============
}

void draw() {
  background(125);
  if (leMenu.isVisible) {
    soundPlacement();
    leMenu.leMenu();
    scoreMenu.isVisible=false;
    inGame.isInGame=false;
  }
  if (scoreMenu.isVisible) {
    soundPlacement();
    leMenu.isVisible=false;
    inGame.isInGame=false;
    scoreMenu.scorMenu();
  }
  if (inGame.isInGame) {
    soundPlacement();
    leMenu.isVisible=false;
    scoreMenu.isVisible=false;
    inGame.inGames();
  }
  if (leRetryMenu.isVisible) {
    soundPlacement();
    leMenu.isVisible=false;
    scoreMenu.isVisible=false;
    inGame.isInGame=false;
    leRetryMenu.leRetryMenu();
  }
  credits();
}