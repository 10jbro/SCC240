class LivesLostScreen {
    final String STATE_EXIT_HIGHLIGHTED = "Go Back to Start Screen";
  
  //initial button state
  String buttonState = STATE_EXIT_HIGHLIGHTED;
  
  Button exitButton = new Button(STATE_EXIT_HIGHLIGHTED, 1150, 500, 300, 100, color(255, 255, 0), true);
  
  LivesLostScreen() {
    
  }
  
  void render() {
      background(102, 153, 51);
      textAlign(CENTER);
      textSize(42);
      fill(0, 0, 0);
      text("All Lives Lost!", 1300, 200);
      text("Thank you for playing!", 1300, 300);
      textSize(30);
      text("Press the Button to go Back to the Start Screen", 1300, 420);
      
      exitButton.setTextConstraints(1300, 560, 24);
      exitButton.render();
    }
    
   void changeState_STATE_EXIT_HIGHLIGHTED() {
     exitButton.invertHighlight();
     buttonState = STATE_EXIT_HIGHLIGHTED;
  }
}
