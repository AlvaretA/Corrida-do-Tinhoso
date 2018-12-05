/* CORRIDA DO TINHOSO™ ©JUNTO & MISTURADO 2018
 SOURCE CODE*/

//Disposição do menu principal.

int creditsRoll=0;
boolean creditsVisible=false, creditsBoolVisible=false;

class mainMenu {
  boolean isVisible;

  mainMenu() {
    isVisible = true;
  }

  void leMenu() {
    if (isVisible) {
      background(255);
      image(menuSplash, 0, 0);
      image(gamelogo, 50, 50);
      image(playButton, 130, 303);
      image(scoreButton, 122, 403);
      image(exitButton, 152, 503);
      image(ver, 0, 572);
      image(devgrey, 650, 492, 150, 108);
      if (mouseX>=650 && mouseX <=800 && mouseY>=492 && mouseY<=600) {
        image(dev, 650, 492, 150, 108);
      }
      if (mouseX>=130 && mouseX<=270 && mouseY>=303 && mouseY<=350) {
        image(playButtonHover, 130, 303);
      }
      if (mouseX>=122 && mouseX<=281 && mouseY>=403 && mouseY<=451) {
        image(scoreButtonHover, 122, 403);
      }
      if (mouseX>=152 && mouseX<=250 && mouseY>=503 && mouseY<=551) {
        image(exitButtonHover, 152, 503);
      }
    }
  }
}

void mouseClicked() {
  if (mouseX>=130 && mouseX<=270 && mouseY>=303 && mouseY<=350 && leMenu.isVisible == true) {
    leMenu.isVisible = false;
    inGame.isInGame = true;
    inGame.showScore=true;
  }
  if (mouseX>=122 && mouseX<=281 && mouseY>=403 && mouseY<=451 && leMenu.isVisible == true) {
    scoreMenu.isVisible = true;
    leMenu.isVisible = false;
  }
  if (mouseX>=650 && mouseX <=800 && mouseY>=492 && mouseY<=600) {
    if (creditsBoolVisible) {
      creditsBoolVisible=false;
    } else {
      creditsBoolVisible=true;
    }
  }
  if (mouseX>=152 && mouseX<=250 && mouseY>=503 && mouseY<=551 && leMenu.isVisible == true) {
    exit();
  }
}

void credits() {
  if (creditsBoolVisible) {
    credits=roll;
    if (!creditsVisible) {
      image(credits, 0, creditsRoll);
      creditsRoll--;
      if (creditsRoll == -2158+600) {
        creditsRoll=0;
        creditsVisible=true;
      } else {
        creditsVisible=false;
      }
    }
  }
}