class UploadScreen {
  
    final String STATE_YES_HIGHLIGHTED = "Yes?";
    final String STATE_NO_HIGHLIGHTED = "No?";
    
     //initial button state
    String buttonState = STATE_YES_HIGHLIGHTED;
    
    Button YesButton = new Button(STATE_YES_HIGHLIGHTED, 750, 500, 150, 50, color(255, 255, 0), true);
    Button NoButton = new Button(STATE_NO_HIGHLIGHTED, 1100, 500, 150, 50, color(255, 255, 0));
    
    void render() {
      background(102, 153, 51);
      textSize(30);
      textAlign(CENTER);
      fill(0, 0, 0);
      text("Upload Score to Leaderboard?", 1000, 270);
      textSize(25);
      text("Score: ", 900, 340);
      fill(255, 255, 0);
      ellipse(825, 630, 80, 80);
      ellipse(1175, 630, 80, 80);
      
      YesButton.setTextConstraints(825, 535, 25);
      YesButton.render();
      NoButton.setTextConstraints(1175, 535, 25);
      NoButton.render();
    }
    
    void changeState_STATE_YES_HIGHLIGHTED() {
      YesButton.invertHighlight();
      NoButton.invertHighlight();
      buttonState = STATE_YES_HIGHLIGHTED;
    }
  
    void changeState_STATE_NO_HIGHLIGHTED() {
      NoButton.invertHighlight();
      YesButton.invertHighlight();
      buttonState = STATE_NO_HIGHLIGHTED;
    }
  
  String getButtonState() {
    return buttonState;
  }
}
