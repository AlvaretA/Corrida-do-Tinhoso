/* CORRIDA DO TINHOSO™ ©JUNTO & MISTURADO 2018
 SOURCE CODE*/

//Sistema de som

void soundPlacement() {
  if (leMenu.isVisible || scoreMenu.isVisible || health <=0 ) {
    if (!menuMusic.isPlaying()) {
      menuMusic.pause();
      menuMusic.rewind();
      menuMusic.play();
    }
  } else {
    menuMusic.pause();
    menuMusic.rewind();
  }
  if (inGame.isInGame) {
    if (cidade && health > 0) {
      if (!cty.isPlaying()) {
        cty.pause();
        cty.rewind();
        cty.play();
      }
    } else {
      cty.pause();
    }
    if (deserto && health > 0) {
      if (!des.isPlaying()) {
        des.pause();
        des.rewind();
        des.play();
      }
    } else {
      des.pause();
    }
    if (inferno && health > 0) {
      if (!hel.isPlaying()) {
        hel.pause();
        hel.rewind();
        hel.play();
      }
    } else {
      hel.pause();
    }
  }
}

void DAMAGESOUND() {
  dmg.play();
  dmg.rewind();
}

void DAMAGESOUND2() {
  dmg2.play();
  dmg2.rewind();
}