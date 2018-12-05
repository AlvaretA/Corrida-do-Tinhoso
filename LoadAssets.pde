/* CORRIDA DO TINHOSO™ ©JUNTO & MISTURADO 2018
 SOURCE CODE*/

//Carregar Minim:
import ddf.minim.*;

//Carregar Vídeo
import processing.video.*;

//Carregar os assets do jogo.

PImage gamelogo, menuSplash, playButton, scoreButton, exitButton, playButtonHover, scoreButtonHover, exitButtonHover, returnButton, returnButtonHover, retryButton, retryButtonHover, toMenu, toMenuHover, skip, skipHover, scoreReg, ver, dev, devgrey, credits, nulle, roll, maca; //Assets de Menus.
PImage player, playernominal, playertiro, playersino, bell, bullet; //Assets de Player.
PImage bg; //Grid
PImage str_cty, div_cty_str, div_cty_mid, div_cty_end; //Assets de Mapas (CIDADE)
PImage str_des, div_des_str, div_des_mid, div_des_end; //Assets de Mapas (DESERTO)
PImage str_hel, div_hel_str, div_hel_mid, div_hel_end; //Assets de Mapas (INFERNO)
PImage tgt, asinha, everson, kpt, pedra, pedra2, tree1, tree2, fogo, diabo; //Assets de Inimigos.
PImage stamina, staminabar, tutorial; //Assets de GUI.

Minim minim;
AudioPlayer menuMusic, cty, des, hel, belli, shot, dmg, dmg2; //Soundtrack
Movie death, start; //Cutscenes

void loadAssets() {
  
  //Menus
  gamelogo=loadImage(dataPath("universal/gamelogo.png")); //Logo do jogo.
  menuSplash=loadImage(dataPath("universal/menuSplash.png")); //Imagem do Menu
  playButton=loadImage(dataPath("buttons/playButton.png")); //Botão "Jogar".
  scoreButton=loadImage(dataPath("buttons/scoreButton.png")); //Botão "Scores"
  exitButton=loadImage(dataPath("buttons/exitButton.png")); //Botão "Sair"
  playButtonHover=loadImage(dataPath("buttons/playButtonHover.png")); //Botão Jogar (HOVER).
  scoreButtonHover=loadImage(dataPath("buttons/scoreButtonHover.png")); //Botão Score (HOVER).
  exitButtonHover=loadImage(dataPath("buttons/exitButtonHover.png")); //Botão Sair (HOVER).
  returnButton=loadImage(dataPath("buttons/returnButton.png")); //Botão Voltar
  returnButtonHover=loadImage(dataPath("buttons/returnButtonHover.png")); //Botão Voltar (HOVER)
  retryButton=loadImage(dataPath("buttons/retryButton.png")); //Botão Tentar Novamente
  retryButtonHover=loadImage(dataPath("buttons/retryButtonHover.png")); //Botão Tentar Novamente (HOVER)
  toMenu=loadImage(dataPath("buttons/toMenu.png")); //Botão Menu
  toMenuHover=loadImage(dataPath("buttons/toMenuHover.png")); //Botão Menu (HOVER)
  scoreReg=loadImage(dataPath("buttons/scoreReg.png")); //REGISTRE SEU SCORE!
  ver=loadImage(dataPath("universal/ver.png")); 
  dev=loadImage(dataPath("universal/dev.png"));
  devgrey=loadImage(dataPath("universal/devgrey.png"));
  roll=loadImage(dataPath("universal/credits.png"));
  nulle=loadImage(dataPath("universal/null.png"));

  //Cutscenes
  skip=loadImage(dataPath("buttons/skip.png")); //Botão para pular cutscene
  skipHover=loadImage(dataPath("buttons/skipHover.png")); //Botão para pular cutscene (HOVER)
  
  //Jogador
  playernominal=loadImage(dataPath("player/playernominal.png")); //Jogador
  playertiro=loadImage(dataPath("player/playertiro.png")); //Jogador atirando
  playersino=loadImage(dataPath("player/playersino.png")); //Jogador usando o sino
  bullet=loadImage(dataPath("player/bullet.png")); //Bala
  maca=loadImage(dataPath("player/maca.png")); //Maçã
  bell=loadImage(dataPath("player/sino.png")); //ícone do sino

  //Mapas
  bg=loadImage(dataPath("testing/bg.png")); //Background mapa (Grid)
  str_cty=loadImage(dataPath("maps/str_cty.png")); //Background Cidade (Reto)
  div_cty_str=loadImage(dataPath("maps/div_cty_str.png")); //Background Cidade (DivStart)
  div_cty_mid=loadImage(dataPath("maps/div_cty_mid.png")); //Background Cidade (DivMiddle)
  div_cty_end=loadImage(dataPath("maps/div_cty_end.png")); //Background Cidade (DivEnd)
  str_des=loadImage(dataPath("maps/str_des.png")); //Background Deserto (Reto)
  div_des_str=loadImage(dataPath("maps/div_des_str.png")); //Background Deserto (DivStart)
  div_des_mid=loadImage(dataPath("maps/div_des_mid.png")); //Background Deserto (DivMiddle)
  div_des_end=loadImage(dataPath("maps/div_des_end.png")); //Background Deserto (DivEnd)
  str_hel=loadImage(dataPath("maps/str_hel.png")); //Background Inferno (Reto)
  div_hel_str=loadImage(dataPath("maps/div_hel_str.png")); //Background Inferno (DivStart)
  div_hel_mid=loadImage(dataPath("maps/div_hel_mid.png")); //Background Inferno (DivMiddle)
  div_hel_end=loadImage(dataPath("maps/div_hel_end.png")); //Background Inferno (DivEnd)

  //Inimigos
  tgt=loadImage(dataPath("enemies/torinho.png")); //Runner
  asinha=loadImage(dataPath("enemies/asinha.png")); //Dasher
  everson=loadImage(dataPath("enemies/everson.png")); //Slider
  pedra=loadImage(dataPath("enemies/pedra.png")); //Pedra
  pedra2=loadImage(dataPath("enemies/pedra2.png")); //Pedra 2
  tree1=loadImage(dataPath("enemies/tree1.png")); //Árvore Caída 1
  tree2=loadImage(dataPath("player/maca.png")); //Árvore Caída 2
  fogo=loadImage(dataPath("enemies/fogo.png")); //Barreira de fogo
  kpt=loadImage(dataPath("enemies/capetinha.png")); //Fire Imp
  //diabo=loadImage(dataPath("enemies/diabo.png")); //Diabo

  //GUI
  stamina=loadImage(dataPath("hud/stamina.png")); //Barra de estamina (contêiner)
  staminabar=loadImage(dataPath("hud/staminabar.png")); //Barra de estamina
  tutorial=loadImage(dataPath("hud/tutorial.png")); //Tutorial

  //Soundtrack
  minim = new Minim(this);
  menuMusic= minim.loadFile(dataPath("ost/menu.wav"));
  cty= minim.loadFile(dataPath("ost/cty.wav"));
  des= minim.loadFile(dataPath("ost/des.wav"));
  hel= minim.loadFile(dataPath("ost/hel.wav"));

  //SFX
  belli=minim.loadFile(dataPath("ost/sfx/sino.wav"));
  shot=minim.loadFile(dataPath("ost/sfx/tiro.wav"));
  dmg=minim.loadFile(dataPath("ost/sfx/dmg.wav"));
  dmg2=minim.loadFile(dataPath("ost/sfx/dmg2.wav"));

  death = new Movie (this, dataPath("video/death.mp4"));
  start = new Movie (this, dataPath("video/start.mp4"));
}