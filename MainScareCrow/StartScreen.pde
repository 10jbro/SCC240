class StartScreen {
  
  final String STATE_START_HIGHLIGHTED = "Start";
  final String STATE_LEADERBOARD_HIGHLIGHTED = "Leaderboard";
  
  //initial button state
  String buttonState = STATE_START_HIGHLIGHTED;
  
  //Button Objects
  Button leaderBoardButton = new Button(STATE_LEADERBOARD_HIGHLIGHTED, 860, 500, 500, 150, color(255, 255, 0));
  Button startButton = new Button(STATE_START_HIGHLIGHTED, 500, 500, 300, 150, color(255, 255, 0), true);
  
  //constructor
  StartScreen() {
  }
  
  void render() {
    background(102, 153, 51);
    textAlign(CENTER);
    textSize(128);
    fill(255, 255, 255);
    text("Cultural Awareness Quiz", 860, 400); //sets position of text and text wording
    
    startButton.setTextConstraints(650, 600, 64);
    startButton.render();
    
    leaderBoardButton.setTextConstraints(1110, 600, 64);
    leaderBoardButton.render();
  }
  
  void changeState_STATE_LEADERBOARD_HIGHLIGHTED() {
    startButton.invertHighlight();
    leaderBoardButton.invertHighlight();
    buttonState = STATE_LEADERBOARD_HIGHLIGHTED;
  }
  
  void changeState_STATE_START_HIGHLIGHTED() {
    startButton.invertHighlight();
    leaderBoardButton.invertHighlight();
    buttonState = STATE_START_HIGHLIGHTED;
  }
  
  String getButtonState() {
    return buttonState;
  }
}
