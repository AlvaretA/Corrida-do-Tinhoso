/* CORRIDA DO TINHOSO™ ©JUNTO & MISTURADO 2018
 SOURCE CODE*/

//Sistema de Score

int scoreInGame=0;
int [] scoreData = new int [3];
char [][] scoreNameData = new char [3][3];
int isScore=0;


void scoreFiller() {
  for (int i=0; i < 3; i++) {
    scoreData[i]=0;
    for (int j=0; j < 3; j++) {
      scoreNameData[i][j]='*';
    }
  }
}

void scoreSystem() {
  if (scoreInGame> scoreData[0]) {
    scoreNameData[0][0]='*';
    scoreNameData[0][1]='*';
    scoreNameData[0][2]='*';
    scoreData[0]=scoreInGame;
  }
  if (scoreInGame < scoreData[0] && scoreInGame > scoreData[1] && scoreInGame > scoreData[2]) {
    scoreNameData[1][0]='*';
    scoreNameData[1][1]='*';
    scoreNameData[1][2]='*';
    scoreData[1]=scoreInGame;
  }
  if (scoreInGame < scoreData[0] && scoreInGame < scoreData[1]) {
    scoreNameData[2][0]='*';
    scoreNameData[2][1]='*';
    scoreNameData[2][2]='*';
    scoreData[2]=scoreInGame;
  }
}