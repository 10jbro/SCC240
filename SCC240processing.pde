/********* VARIABLES *********/

// We control which screen is active by settings / updating
// gameScreen variable. We display the correct screen according
// to the value of this variable.
//
// 0: Initial Screen
// 1: Game Screen
// 2: Game-over Screen

int gameScreen = 0;
String[] questions = {"Question 1", "Question 2", "Question 3"};
String[] q1Answers = {"A", "B", "C", "D"};
String[] q2Answers = {"A", "B", "C", "D"};
String[] q3Answers = {"A", "B", "C", "D"};

/********* SETUP BLOCK *********/

void setup() {
  size(1720, 880);
  surface.setTitle("Cultural Awareness Quiz | SCC.240 Group Project"); //sets title for sketch
}

/********* DRAW BLOCK *********/

void draw() {
  // Display the contents of the current screen
  if (gameScreen == 0) {
    questionScreen();
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
  textSize(64);
  text("Click to start", 860, 440);
}

void startScreen() {
  // code for start screen
  background(102, 153, 51);
  textAlign(CENTER);
  textSize(128);
  fill(255, 255, 255);
  text("Cultural Awareness Quiz", 860, 400); //sets position of text and text wording
  
  fill(255, 255, 0);
  rect(500, 500, 300, 150, 7);
  fill(0, 0, 0);
  textSize(64);
  text("Start", 650, 600); //sets position of text and text wording
  
  fill(255, 255, 0);
  rect(860, 500, 500, 150, 7); //x,y, width, height, border radius
  fill(0, 0, 0);
  text("Leaderboard", 1110, 600); //sets position of text and text wording
}

void leaderboardScreen() {
  // codes of game screen
  background(102, 153, 51);
  textSize(60);
  fill(0,0,0);
  text("Leaderboard", 900, 100); //sets position of text and text wording
  
  String[] lines = loadStrings("leaderboard.txt");
  if(loadStrings("leaderboard.txt") == null)
  {
    println("file not found");
  }
  else
  {
    println("there are " + lines.length + " lines");
      for (int i = 0 ; i < lines.length; i++) 
      {
        println(lines[i]);
        //String leaderLine = lines[i];
      }
      
      textSize(30);
      text(lines[0], 1050, 250);
      text(lines[1], 1050, 325);
      text(lines[2], 1050, 400);
      text(lines[3], 1050, 475);
      text(lines[4], 1050, 550);
  }
  
  
  fill(255, 255, 0);
  rect(915, 700, 340, 110, 7); //x,y, width, height, border radius
  textSize(24);
  fill(0,0,0);
  text("Go Back to Start Screen", 950, 765);
}

void skipTutorialScreen() {
  // codes of skip tutorial screen
  background(102, 153, 51);
  textAlign(CENTER);
  textSize(128);
  fill(255, 255, 255);
  text("Would you like a tutorial?", 860, 300); //sets position of text and text wording
  
  //Yes button
  fill(255, 255, 0);
  rect(700, 400, 300, 150, 7);
  fill(0, 0, 0); //black text
  textSize(64);
  text("Yes", 850, 500); //sets position of text and text wording
  
  //Skip button
  fill(255, 255, 0);
  rect(600, 600, 500, 150, 7);
  fill(0, 0, 0);
  textSize(64);
  text("Skip tutorial", 850, 700); //sets position of text and text wording
}

void tutorialScreen() {
  // code for tutorial screen
  // codes of skip tutorial screen
  background(102, 153, 51);
  textAlign(CENTER);
  textSize(128);
  fill(255, 255, 255);
  text("Tutorial", 860, 200); //sets position of text and text wording
  
  //Clap
  fill(229, 255, 204);
  rect(200, 300, 200, 150, 7);
  fill(0, 0, 0); //black text
  textSize(64);
  text("Clap", 300, 400); //sets position of text and text wording
  fill(255,255,255);
  textSize(32);
  text("to select\noption A", 300, 500); //sets position of text and text wording

  //Tap
  fill(229, 255, 204);
  rect(500, 300, 200, 150, 7);
  fill(0, 0, 0);
  textSize(64);
  text("Tap", 600, 400); //sets position of text and text wording
  fill(255,255,255);
  textSize(32);
  text("to select\noption B", 600, 500); //sets position of text and text wording
  
  //Breathe
  fill(229, 255, 204);
  rect(800, 300, 300, 150, 7);
  fill(0, 0, 0);
  textSize(64);
  text("Breathe", 950, 400); //sets position of text and text wording
  fill(255,255,255);
  textSize(32);
  text("to select option C", 950, 500); //sets position of text and text wording
  
  //Photo-resistor
  fill(229, 255, 204);
  rect(1200, 300, 460, 150, 7);
  fill(0, 0, 0);
  textSize(64);
  text("Cover Sensor", 1420, 400); //sets position of text and text wording
  fill(255,255,255);
  textSize(32);
  text("to select option D", 1420, 500); //sets position of text and text wording
  
  textSize(32);
  fill(255,255,255);
  text("Want to play the old-fashioned way? Move the joystick to select your chosen answer and click to answer.", 850, 650); //sets position of text and text wording
  
  //Play game button
  fill(255, 255, 0);
  rect(650, 720, 380, 140, 7);
  fill(0, 0, 0);
  textSize(64);
  text("Play Game", 850, 810); //sets position of text and text wording
}

void difficultyScreen() {
  //code for difficulty screen
  background(102, 153, 51);
  textAlign(CENTER);
  textSize(128);
  fill(255, 255, 255);
  text("Select Difficulty", 860, 200); //sets position of text and text wording
  
  //Easy mode button
  rect(700, 250, 300, 150, 7);
  fill(0, 0, 0);
  textSize(64);
  text("Easy", 850, 350); //sets position of text and text wording
  
  //Normal mode button
  fill(255, 255, 255);
  rect(700, 450, 300, 150, 7);
  fill(0, 0, 0);
  textSize(64);
  text("Normal", 850, 550); //sets position of text and text wording
  
  //Hard mode button
  fill(255, 255, 255);
  rect(700, 650, 300, 150, 7);
  fill(0, 0, 0);
  textSize(64);
  text("Hard", 850, 750); //sets position of text and text wording
}

void questionScreen() {
  //code for question screen
  background(102, 153, 51);
  textAlign(CENTER);
  textSize(64);
  fill(255, 255, 255);
  text(questions[0], 1400, 200); //sets position of text and text wording
  
  fill(0, 255, 0);
  ellipse(60, 60, 100, 100);
  ellipse(170, 60, 100, 100);
  ellipse(280, 60, 100, 100);
  fill(0, 200, 255);
  ellipse(1650, 60, 100, 100);
  
  fill(255, 255, 255);
  textSize(32);
  text("Time: ", 400, 50); //sets position of text and text wording
  text("Score: ", 400, 90); //sets position of text and text wording
  text("Round 1 ", 1500, 70); //sets position of text and text wording
  
  fill(255, 255, 255);
  rect(50, 200, 1000, 600, 7);
  fill(0, 0, 0);
  text("Character Animations", 550, 500); //sets position of text and text wording

  //Option A
  fill(255, 255, 255);
  rect(1200, 250, 400, 100, 7);
  fill(0, 0, 0);
  textSize(48);
  text(q1Answers[0], 1400, 320); //sets position of text and text wording
  
  //Option B
  fill(255, 255, 255);
  rect(1200, 400, 400, 100, 7);
  fill(0, 0, 0);
  textSize(48);
  text(q1Answers[1], 1400, 470); //sets position of text and text wording
  
  //Option C
  fill(255, 255, 255);
  rect(1200, 550, 400, 100, 7);
  fill(0, 0, 0);
  textSize(48);
  text(q1Answers[2], 1400, 620); //sets position of text and text wording
  
  //Option D
  fill(255, 255, 255);
  rect(1200, 700, 400, 100, 7);
  fill(0, 0, 0);
  textSize(48);
  text(q1Answers[3], 1400, 770); //sets position of text and text wording
}

void gameScreen() {
  // codes of game screen
}

void gameAndTutorialScreen() {
  // codes of game screen
}
void continueScreen() {
 // code for continue screen
  background(102, 153, 51);
  textAlign(CENTER);
  textSize(128);
  fill(255, 255, 255);
  text("Time remaining:", 860, 400); //sets position of text and text wording
  
  fill(255, 255, 0);
  rect(500, 500, 400, 150, 7);
  fill(0, 0, 0);
  textSize(64);
  text("Continue", 700, 600); //sets position of text and text wording
  
  fill(255, 255, 0);
  rect(980, 500, 250, 150, 7); //x,y, width, height, border radius
  fill(0, 0, 0);
  text("Exit", 1110, 600); //sets position of text and text wording
}

void exitScreen() {
 // code for continue screen
  background(102, 153, 51);
  textAlign(CENTER);
  textSize(64);
  fill(255, 255, 255);
  text("Thanks for\nplaying", 1450, 300); //sets position of text and text wording
  
  fill(255, 255, 0);
  rect(1300, 500, 300, 100, 7);
  fill(0, 0, 0);
  textSize(32);
  text("Return to home", 1450, 560); //sets position of text and text wording
}

void uploadScreen() {
  background(102, 153, 51);
  textSize(30);
  textAlign(CENTER);
  fill(0, 0, 0);
  text("Upload Score to Leaderboard?", 1000, 270);
  textSize(25);
  text("Score: ", 900, 340);
  fill(255, 255, 0);
  rect(750, 500, 150, 50, 7);
  rect(1100, 500, 150, 50, 7);
  fill(0, 0, 0);
  text("Yes?", 825, 535);
  text("No?", 1175, 535);
  fill(255, 255, 0);
  ellipse(825, 630, 80, 80);
  ellipse(1175, 630, 80, 80);
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
