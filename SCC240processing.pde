/********* VARIABLES *********/

// We control which screen is active by settings / updating
// gameScreen variable. We display the correct screen according
// to the value of this variable.
//
// 0: Initial Screen
// 1: Game Screen
// 2: Game-over Screen

int gameScreen = 0;

int rectX, rectY;      // Position of square button
int rectSize = 90;     // Diameter of rect
color rectColor, baseColor;
color rectHighlight;
color currentColor;
boolean rectOver = false;

/********* SETUP BLOCK *********/

void setup() {
  size(1720, 880);
}


/********* DRAW BLOCK *********/

void draw() {
  // Display the contents of the current screen
  if (gameScreen == 0) {
    //initScreen();
    leaderScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
  }
}


/********* SCREEN CONTENTS *********/

void initScreen() {
  // codes of initial screen
  background(0);
  textAlign(CENTER);
  text("Click to start", 860, 440);
}
void leaderScreen() {
  // code for leaderboard screen
  background(255, 255, 0);
  
  //Leaderboard text
  textAlign(CENTER);
  textSize(40);
  fill(0);
  text("Leaderboard", 1200, 100);
  
  //Array from leaderbaord txt file
  String[] lines = loadStrings();
  
  rect(1100, 600, 200, 70);
  textSize(15);
  fill(255);
  text("Go Back to Start Screen", 1200, 640);
  
  
}
void wantTutorialScreen() {
  // codes of game screen
}
void tutorialScreen() {
  // codes of game screen
}
void difficultyScreen() {
  // codes of game screen
}
void gameScreen() {
  // codes of game screen
}
void gameAndTutorialScreen() {
  // codes of game screen
}
void continueScreen() {
  // codes of game screen
}
void uploadScreen() {
  // codes of game screen
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
