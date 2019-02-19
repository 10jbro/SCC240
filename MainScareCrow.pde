import processing.serial.*;
Serial myPort;

/********* VARIABLES *********/

String val="", gameState;
color backgroundColour, fillColour;
boolean up = false, down = false, left = false, right = false, click = false, highlightOnleft = true;
int sizeOfText, padding = 20, buttonWidth = 100, buttonHeight = 50;

/********* OBJECTS *********/

StartScreen StartScreenUI = new StartScreen();
SkipTutorialScreen SkipTutorialUI = new SkipTutorialScreen();
TutorialScreen TutorialUI = new TutorialScreen();

/********* GAME STATES *********/

final String STATE_ZERO_IDLE = "State_String_0";
final String STATE_START_SCREEN = "State_String_1";
final String STATE_LEADERBOARD_SCREEN = "State_String_2";
final String STATE_SKIP_TUTORIAL_SCREEN = "State_String_3";
final String STATE_TUTORIAL_SCREEN = "State_String_4";
final String STATE_DIFFICULTY_SCREEN = "State_String_5";
final String STATE_QUESTION_SCREEN = "State_String_6";
final String STATE_CONTINUE_SCREEN = "State_String_7";
//final String STATE_ = "State_String_5";
//final String STATE_ = "State_String_4";
//final String STATE_ = "State_String_5";
//final String STATE_ = "State_String_4";
final String STATE_GAME_OVER_SCREEN = "State_String_6";


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

int QuestionX = 1400;
boolean check = false;


/********* SETUP BLOCK *********/

void setup() {
  size(1720, 880);
  surface.setTitle("Cultural Awareness Quiz | SCC.240 Group Project"); //sets title for sketch
  //this.arduino();
  gameStateInit();

}

/********* DRAW BLOCK *********/

void draw() {
  //checksInput();
  update();
}

/********* METHODS *********/

//setting up arduino inputs
void arduino() {
  //String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  //myPort = new Serial(this, portName, 9600);
  myPort = new Serial(this, "/COM3", 9600);
  myPort.bufferUntil('n'); /* test for redundency*/
}

//finds arduino sensor data
void checksInput() {
  
  if(myPort.available() > 0) {
    val = myPort.readStringUntil('\n');

    if (val != null) {
    
      //checks for up pressed
      if(val.startsWith("X-axis: 0")) {
        println("up: I've seen an x-axis " + val);
        up = true;
      }
      
      //checks for down pressed
      if(val.startsWith("X-axis: 1")) {
        println("down: I've seen an x-axis " + val);
        down = true;
      }
        
      //checks right pressed
      if(val.startsWith("Y-axis: 0")) {
        println("right: I've seen an Y-axis " + val);
        right = true;
      }
    
      //checks for left pressed
      if(val.startsWith("Y-axis: 1")) {
        println("left: I've seen an y-axis " + val);
        left = true;
      }
      
      //checks for button clicked
      if(val.startsWith("Switch:  0")) {
        println("button clicked: I've seen a button clicked " + val);
        click = true;
      }
    }
  }
}

void resetInputState() {
  up = false;
  down = false;
  left = false;
  right = false;
  click = false;
  println("reset: " + up + " " + down + " " + left + " " + right);
}

void update() {
  switch(gameState) {
    case STATE_ZERO_IDLE:
      if(click) {
        gameState = STATE_START_SCREEN;
      }
      break;
    case STATE_START_SCREEN:
      StartScreenUI.render();
      if(right && StartScreenUI.getButtonState().equals("Start"))
      {
        StartScreenUI.changeState_STATE_LEADERBOARD_HIGHLIGHTED();
      }
      else if(left && StartScreenUI.getButtonState().equals("Leaderboard")) 
      {
        StartScreenUI.changeState_STATE_START_HIGHLIGHTED();
      }
      else if(click) 
      {
        if(StartScreenUI.getButtonState().equals("Start")) 
        {
          gameState = STATE_SKIP_TUTORIAL_SCREEN;
        }
        else if(StartScreenUI.getButtonState().equals("Leaderboard")) 
        {
          println("leaderboard");
        }
      }
      break;
    case STATE_SKIP_TUTORIAL_SCREEN:
      
      SkipTutorialUI.render();
      if(right && SkipTutorialUI.getButtonState().equals("Yes"))
      {
        SkipTutorialUI.changeState_STATE_SKIP_HIGHLIGHTED();
      }
      else if(left && SkipTutorialUI.getButtonState().equals("Skip"))
      {
        SkipTutorialUI.changeState_STATE_ACCEPT_HIGHLIGHTED();
      }
      else if(click) 
      {
        if(SkipTutorialUI.getButtonState().equals("Skip")) 
        {
          gameState = STATE_QUESTION_SCREEN;
        }
        else if(SkipTutorialUI.getButtonState().equals("Yes")) 
        {
          gameState = STATE_TUTORIAL_SCREEN;
        }
      }
      break;
    case STATE_TUTORIAL_SCREEN:
      TutorialUI.render();
      if(click) {
        gameState = STATE_CONTINUE_SCREEN;
      }
      break;
    case STATE_DIFFICULTY_SCREEN:
      //if() {
        //gameState = STATE_QUESTION_SCREEN;
      //}
      //} else if() {
      //}
      break;
    case STATE_QUESTION_SCREEN: 
      //if() {
        //gameState = STATE_GAME_OVER_SCREEN;
      //}
      //} else if() {
      //}
      break;
  }
  
  //reset input boolean
  resetInputState();
  
  //println(gameState);
}


/********* STATES *********/

//initialise game state to STATE_ZERO_IDLE
void gameStateInit() {
  gameState = STATE_ZERO_IDLE;
  background(0);
  textAlign(CENTER);
  textSize(64);
  text("Press on joystick to start", 860, 440);
  println("init: " + gameState);
}

void leaderboardScreen() {
  // codes of game screen
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

  
  /*Button buttonA = new Button(q1Answers[0], 1200, 250, 400, 100, color(255,255,255));
  buttonA.setTextX(QuestionX);
  buttonA.setSelected(check);
  buttonA.render();
  
  Button buttonB = new Button(q1Answers[1], 1200, 400, 400, 100, color(255,255,255));
  buttonB.setTextX(QuestionX);
  buttonB.render();
  
  Button buttonC = new Button(q1Answers[2], 1200, 550, 400, 100, color(255,255,255));
  buttonC.setTextX(QuestionX);
  buttonC.render();
  
  Button buttonD = new Button(q1Answers[3], 1200, 700, 400, 100, color(255,255,255));
  buttonD.setTextX(QuestionX);
  buttonD.render();*/
  
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
}
void gameOverScreen() {
  // codes for game over screen
}


/********* INPUTS *********/

void keyPressed() {
  switch(key) {
    case 'c':
      click = true;
      println("click pressed\n");
      break;
    case 'w':
      up = true;
      println("up pressed\n");
      break;
    case 's':
      down = true;
      println("down pressed\n");
      break;
    case 'a':
      left = true;
      println("left pressed\n");
      break;
    case 'd':
      right = true;
      println("right pressed\n");
      break;
  }
}
