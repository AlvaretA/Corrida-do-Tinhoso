/* CORRIDA DO TINHOSO™ ©JUNTO & MISTURADO 2018
 SOURCE CODE*/

//Menu do Scoreboard.

PFont handmadeMemories;

class scoreMenu {
  boolean isVisible;

  scoreMenu() {
    isVisible = false;
  }

  void scorMenu() {
    isVisible = true;
    image(menuSplash, 0, 0);
    image(gamelogo, 232, 25);
    fill(153, 0, 0);
    text("SCOREBOARD", 315, 300);
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
    image(returnButton, 325, 525);
    if (scoreMenu.isVisible==true) {
      if (mouseX>=325 && mouseX<=465 && mouseY>=525 && mouseY<=572) {
        image(returnButtonHover, 325, 525);
        if (mousePressed) {
          leMenu.isVisible=true;
          scoreMenu.isVisible=false;
        }
      }
    }
  }
}