import processing.serial.*;
Serial myPort;

/********* VARIABLES *********/

String val="", gameState;
color backgroundColour, fillColour;
boolean up = false, down = false, left = false, right = false, click = false, highlightOnleft = true;
int sizeOfText, padding = 20, buttonWidth = 100, buttonHeight = 50;
Timer startTimer;

int timerLength;

/********* OBJECTS *********/

StartScreen StartScreenUI = new StartScreen();
SkipTutorialScreen SkipTutorialUI = new SkipTutorialScreen();
TutorialScreen TutorialUI = new TutorialScreen();
DifficultyScreen DifficultyUI = new DifficultyScreen();
QuestionScreen QuestionUI = new QuestionScreen();
ContinueScreen ContinueUI = new ContinueScreen();
LeaderboardScreen LeaderboardUI = new LeaderboardScreen();
UploadScreen UploadUI = new UploadScreen();
LivesLostScreen LivesLostUI = new LivesLostScreen();
ExitScreen ExitUI = new ExitScreen();


/********* GAME STATES *********/

final String STATE_ZERO_IDLE = "State_String_0";
final String STATE_START_SCREEN = "State_String_1";
final String STATE_LEADERBOARD_SCREEN = "State_String_2";
final String STATE_SKIP_TUTORIAL_SCREEN = "State_String_3";
final String STATE_TUTORIAL_SCREEN = "State_String_4";
final String STATE_DIFFICULTY_SCREEN = "State_String_5";
final String STATE_QUESTION_SCREEN = "State_String_6";
final String STATE_CONTINUE_SCREEN = "State_String_7";
final String STATE_EXIT_SCREEN = "State_String_8";
final String STATE_UPLOAD_SCREEN = "State_String_9";
final String STATE_LIVESLOST_SCREEN = "State_String_10";


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
  QuestionUI.initload();
  LeaderboardUI.initload();
  gameStateInit();
  startTimer = new Timer(8);
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
  //println("reset: " + up + " " + down + " " + left + " " + right);
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
          gameState = STATE_LEADERBOARD_SCREEN;
        }
      }
      break;
      case STATE_LEADERBOARD_SCREEN:
      LeaderboardUI.render();
      if(click) {
        gameState = STATE_START_SCREEN;
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
          gameState = STATE_DIFFICULTY_SCREEN;
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
        gameState = STATE_DIFFICULTY_SCREEN;
      }
      break;
    case STATE_DIFFICULTY_SCREEN:
      DifficultyUI.render();
      if(DifficultyUI.getButtonState().equals("Medium"))
      {
        if(up){
          DifficultyUI.changeState_STATE_HARD_HIGHLIGHTED();
        }
        else if(down){
          DifficultyUI.changeState_STATE_EASY_HIGHLIGHTED();
        }
      }
      else if(down && DifficultyUI.getButtonState().equals("Hard"))
      {
        DifficultyUI.changeState_STATE_MEDIUM_HIGHLIGHTED();
      }
      else if(up && DifficultyUI.getButtonState().equals("Easy"))
      {
        DifficultyUI.changeState_STATE_MEDIUM_HIGHLIGHTED();
      }
      else if(click) 
      {
        if(DifficultyUI.getButtonState().equals("Hard")) 
        {
          gameState = STATE_QUESTION_SCREEN;
          timerLength = 10;
          startTimer = new Timer(timerLength);
        }
        else if(DifficultyUI.getButtonState().equals("Medium")) 
        {
          gameState = STATE_QUESTION_SCREEN;
          timerLength = 20;
          startTimer = new Timer(timerLength);
        }
        else if(DifficultyUI.getButtonState().equals("Easy")) 
        {
          gameState = STATE_QUESTION_SCREEN;
          timerLength = 30;
          startTimer = new Timer(timerLength);
        }
      }
      break;
    case STATE_QUESTION_SCREEN: 

      QuestionUI.render();

      if((left || right) && !QuestionUI.getOverride()) 

      {

        QuestionUI.overrideToJoystick();

        println("overide: " + QuestionUI.getButtonState());

      }

      if(QuestionUI.getOverride()){

        if(down && QuestionUI.getButtonState().equals("A")) 

        {

           QuestionUI.changeState_STATE_B_HIGHLIGHTED();

        }

        else if(QuestionUI.getButtonState().equals("B")) 

        {

          if(up) {

            QuestionUI.changeState_STATE_A_HIGHLIGHTED();

          }

          else if(down) {

            QuestionUI.changeState_STATE_C_HIGHLIGHTED();

          }

        }

        else if(QuestionUI.getButtonState().equals("C")) 

        {

          if(up) {

            QuestionUI.changeState_STATE_B_HIGHLIGHTED();

          }

          else if(down) {

            QuestionUI.changeState_STATE_D_HIGHLIGHTED();

          }

        }
        else if(up && QuestionUI.getButtonState().equals("D")) 
        {
           QuestionUI.changeState_STATE_C_HIGHLIGHTED();
        }
        else if(click) {
           gameState = STATE_CONTINUE_SCREEN;
           
        }
      }
      break;
      case STATE_UPLOAD_SCREEN: 
        UploadUI.render();
      if(right && UploadUI.getButtonState().equals("Yes?")) {
        UploadUI.changeState_STATE_NO_HIGHLIGHTED();
        } 
      else if(left && UploadUI.getButtonState().equals("No?")) {
        UploadUI.changeState_STATE_YES_HIGHLIGHTED();
      }
      else if(click) 
      {
        if(UploadUI.getButtonState().equals("Yes?")) 
        {
          gameState = STATE_EXIT_SCREEN;
          println("Score Uploaded");
        }
        else if(UploadUI.getButtonState().equals("No?")) 
        {
          gameState = STATE_EXIT_SCREEN;
        }
      }
      break;
      case STATE_CONTINUE_SCREEN: 
        startTimer = new Timer(30);
        ContinueUI.render();
      if(right && ContinueUI.getButtonState().equals("Continue")) {
        ContinueUI.changeState_STATE_EXIT_HIGHLIGHTED();
        } 
      else if(left && ContinueUI.getButtonState().equals("Exit")) {
        ContinueUI.changeState_STATE_CONTINUE_HIGHLIGHTED();
      }
      else if(click) 
      {
        if(ContinueUI.getButtonState().equals("Continue")) 
        {
          gameState = STATE_QUESTION_SCREEN;
          startTimer = new Timer(timerLength);
        }
        else if(ContinueUI.getButtonState().equals("Exit")) 
        {
          gameState = STATE_UPLOAD_SCREEN;
        }
      }
      break;
      case STATE_LIVESLOST_SCREEN:
      LivesLostUI.render();
      if(click) {
        gameState = STATE_START_SCREEN;
      }
      break;
      case STATE_EXIT_SCREEN:
      ExitUI.render();
      if(click) {
        gameState = STATE_START_SCREEN;
      }
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
