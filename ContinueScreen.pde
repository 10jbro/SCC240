class ContinueScreen {

    final String STATE_CONTINUE_HIGHLIGHTED = "Continue";
    final String STATE_EXIT_HIGHLIGHTED = "Exit";
    
    String buttonState = STATE_CONTINUE_HIGHLIGHTED;
    
    Button continueButton = new Button(STATE_CONTINUE_HIGHLIGHTED, 500, 500, 400, 150, color(255, 255, 0), true);
    Button exitButton = new Button(STATE_EXIT_HIGHLIGHTED, 980, 500, 250, 150, color(255, 255, 0));
    
    ContinueScreen() {
      
    }
    
    void render() {
      background(102, 153, 51);
      textAlign(CENTER);
      textSize(128);
      fill(255, 255, 255);
      text("Time remaining:", 860, 400); //sets position of text and text wording
      
      continueButton.setTextConstraints(700, 600, 64);
      continueButton.render();
      exitButton.setTextConstraints(1110, 600, 64);
      exitButton.render();
    }
    
    void changeState_STATE_CONTINUE_HIGHLIGHTED() {
      continueButton.invertHighlight();
      exitButton.invertHighlight();
      buttonState = STATE_CONTINUE_HIGHLIGHTED;
    }
  
    void changeState_STATE_EXIT_HIGHLIGHTED() {
      continueButton.invertHighlight();
      exitButton.invertHighlight();
      buttonState = STATE_EXIT_HIGHLIGHTED;
    }
    
    String getButtonState() {
    return buttonState;
  }
}
