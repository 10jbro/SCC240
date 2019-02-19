class SkipTutorialScreen {

  final String STATE_SKIP_HIGHLIGHTED = "Skip";
  final String STATE_ACCEPT_HIGHLIGHTED = "Yes";
  
  //initial button state
  String buttonState = STATE_ACCEPT_HIGHLIGHTED;
  
  //Button Objects
  Button acceptTutorial = new Button(STATE_ACCEPT_HIGHLIGHTED, 500, 500, 300, 150, color(255, 255, 0),true);
  Button skipTutorial = new Button(STATE_SKIP_HIGHLIGHTED, 860, 500, 300, 150, color(255, 255, 0));
  
  void render()
  {
      // codes of skip tutorial screen
      background(102, 153, 51);
      textAlign(CENTER);
      textSize(128);
      fill(255, 255, 255);
      text("Would you like a tutorial?", 860, 300); //sets position of text and text wording
      
      //Yes button
      acceptTutorial.setTextConstraints(650, 600, 64);
      acceptTutorial.render(); 
      
      //Skip button      
      skipTutorial.setTextConstraints(1015, 600, 64);
      skipTutorial.render();  
  }
  
  void changeState_STATE_SKIP_HIGHLIGHTED() { 
    skipTutorial.invertHighlight();
    acceptTutorial.invertHighlight();
    buttonState = STATE_SKIP_HIGHLIGHTED;
  }
  
  void changeState_STATE_ACCEPT_HIGHLIGHTED() { 
    skipTutorial.invertHighlight();
    acceptTutorial.invertHighlight();
    buttonState = STATE_ACCEPT_HIGHLIGHTED;
  }
  
  String getButtonState() {
    return buttonState;
  }
}