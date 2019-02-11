/********* VARIABLES *********/

// We control which screen is active by settings / updating
// gameScreen variable. We display the correct screen according
// to the value of this variable.
//
// 0: Initial Screen
// 1: Game Screen
// 2: Game-over Screen

int gameScreen = 0;

/********* SETUP BLOCK *********/

void setup() {
  size(1720, 880);
  surface.setTitle("Cultural Awareness Quiz | SCC.240 Group Project"); //sets title for sketch
}

/********* DRAW BLOCK *********/

void draw() {
  // Display the contents of the current screen
  if (gameScreen == 0) {
    startScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
  }
}


/********* SCREEN CONTENTS *********/
void startScreen() {
  // code for start screen
  background(255,255,0);
  textAlign(CENTER);
  textSize(128);
  fill(102, 153, 51);
  text("Cultural Awareness Quiz", 860, 400); //sets position of text and text wording
  
  rect(500, 500, 300, 150, 7);
  fill(255, 255, 255);
  textSize(64);
  text("Start", 650, 600); //sets position of text and text wording
  
  fill(102, 153, 51);
  rect(860, 500, 500, 150, 7); //x,y, width, height, border radius
  fill(255, 255, 255);
  text("Leaderboard", 1110, 600); //sets position of text and text wording
}
void initScreen() {
  // codes of initial screen
  background(0);
  textAlign(CENTER);
  text("Click to start", 860, 440);
}
void leaderScreen() {
  // codes of game screen
}
void wantTutorialScreen() {
  // codes of game screen
}
void tutorialScreen() {
  // codes of game screen
}
void difficultyScreen() {
  //code for difficulty screen
  background(255,255,0);
  textAlign(CENTER);
  textSize(128);
  fill(0, 0, 0);
  text("Select Difficulty", 860, 200); //sets position of text and text wording
  
  //Easy mode button
  fill(102, 153, 51);
  rect(700, 250, 300, 150, 7);
  fill(255, 255, 255);
  textSize(64);
  text("Easy", 850, 350); //sets position of text and text wording
  
  //Normal mode button
  fill(102, 153, 51);
  rect(700, 450, 300, 150, 7);
  fill(255, 255, 255);
  textSize(64);
  text("Normal", 850, 550); //sets position of text and text wording
  
  //Hard mode button
  fill(102, 153, 51);
  rect(700, 650, 300, 150, 7);
  fill(255, 255, 255);
  textSize(64);
  text("Hard", 850, 750); //sets position of text and text wording
}
void gameScreen() {
  // codes of game screen
}
void gameAndTutorialScreen() {
  // codes of game screen
}
void continueScreen() {
 // code for continue screen
  background(255,255,0);
  textAlign(CENTER);
  textSize(128);
  fill(102, 153, 51);
  text("Time remaining:", 860, 400); //sets position of text and text wording
  
  rect(500, 500, 300, 150, 7);
  fill(255, 255, 255);
  textSize(64);
  text("Continue?", 650, 600); //sets position of text and text wording
  
  fill(102, 153, 51);
  rect(860, 500, 500, 150, 7); //x,y, width, height, border radius
  fill(255, 255, 255);
  text("Exit?", 1110, 600); //sets position of text and text wording
}
void uploadScreen() {
}
void gameOverScreen() {
  // codes for game over screen
}


/********* INPUTS *********/

public void mousePressed() {
  // if we are on the initial screen when clicked, start the game
  if (gameScreen==0) {
    startGame();
  }
}


/********* OTHER FUNCTIONS *********/

// This method sets the necessary variables to start the game  
void startGame() {
  gameScreen=1;
}
