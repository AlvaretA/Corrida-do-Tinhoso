/* CORRIDA DO TINHOSO™ ©JUNTO & MISTURADO 2018
 SOURCE CODE*/

// Menu de nova tentativa

class retryMenu {
  boolean isVisible, isAnimVisible2;

  retryMenu() {
    isVisible=false;
    isAnimVisible2=false;
  }

  void leRetryMenu() {
    if (isVisible) {
      if (death.time() > 11.2) {
        death.stop();
        isAnimVisible2=true;
      }
      if (!isAnimVisible2) {
        image(death, 0, 0, 800, 600);
        death.loop();
      } else {
        background(255);
        image(menuSplash, 0, 0);
        image(gamelogo, 232, 25);
        fill(153, 0, 0);
        text(scoreData[0], 500, 350);
        text(scoreNameData[0][0], 300, 350);
        text(scoreNameData[0][1], 320, 350);
        text(scoreNameData[0][2], 340, 350);
        text(scoreData[1], 500, 400);
        text(scoreNameData[1][0], 300, 400);
        text(scoreNameData[1][1], 320, 400);
        text(scoreNameData[1][2], 340, 400);
        text(scoreData[2], 500, 450);
        text(scoreNameData[2][0], 300, 450);
        text(scoreNameData[2][1], 320, 450);
        text(scoreNameData[2][2], 340, 450);
        image(retryButton, 255, 514);
        image(toMenu, 370, 557);
         image(scoreReg, 270, 270);
        if (mouseX >= 370 && mouseX<= 429 && mouseY>=557 && mouseY<=580) {
          image(toMenuHover, 370, 557);
          if (mousePressed) {
            inGame.isInGame=false;
            leRetryMenu.isVisible=false;
            leMenu.isVisible=true;
            scoreInGame=0;
            isAnimVisible2=false;
          }
        }
        if (mouseX >= 255 && mouseX <= 544 && mouseY>= 514 && mouseY<= 545) {
          image (retryButtonHover, 255, 514);
          if (mousePressed) {
            leMenu.isVisible=false;
            leRetryMenu.isVisible=false;
            inGame.isInGame=true;
            scoreInGame=0;
            isAnimVisible2=false;
          }
        }
      }
    }
  }
}