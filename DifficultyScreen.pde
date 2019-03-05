class DifficultyScreen {
    final String STATE_HARD_HIGHLIGHTED = "Hard";
    final String STATE_MEDIUM_HIGHLIGHTED = "Medium";
    final String STATE_EASY_HIGHLIGHTED = "Easy";
    
      //initial button state
    String buttonState = STATE_MEDIUM_HIGHLIGHTED;
    
    Button hardButton = new Button(STATE_HARD_HIGHLIGHTED, 900, 250, 300, 150, color(255, 255, 0));
    Button mediumButton = new Button(STATE_MEDIUM_HIGHLIGHTED, 900, 450, 300, 150, color(255, 255, 0), true);
    Button easyButton = new Button(STATE_EASY_HIGHLIGHTED, 900, 650, 300, 150, color(255, 255, 0));
    
    PImage[] img = new PImage[3];
 
     void initload(){
       img[0] = loadImage("./tutorialImages/scarecrowStart.png");
     }
    
    DifficultyScreen() {
      
    }
    
    void render() {
      //code for difficulty screen
      background(102, 153, 51);
      textAlign(CENTER);
      textSize(128);
      fill(255, 255, 255);
      text("Select Difficulty", 860, 180); //sets position of text and text wording
      image(img[0], 50, 200, 1000, 600);
      
      hardButton.setTextConstraints(1050, 350, 64);
      hardButton.render();
      mediumButton.setTextConstraints(1050, 550, 64);
      mediumButton.render();
      easyButton.setTextConstraints(1050, 750, 64);
      easyButton.render();
    }
    
    void changeState_STATE_HARD_HIGHLIGHTED() {
      hardButton.invertHighlight();
      mediumButton.invertHighlight();
      buttonState = STATE_HARD_HIGHLIGHTED;
    }
  
    void changeState_STATE_MEDIUM_HIGHLIGHTED() {
      if(buttonState.equals(STATE_HARD_HIGHLIGHTED)){
        hardButton.invertHighlight();
      }
      else if(buttonState.equals(STATE_EASY_HIGHLIGHTED)){
        easyButton.invertHighlight();
      }
      mediumButton.invertHighlight();
      buttonState = STATE_MEDIUM_HIGHLIGHTED;
    }
    
    void changeState_STATE_EASY_HIGHLIGHTED() {
      mediumButton.invertHighlight();
      easyButton.invertHighlight();
      buttonState = STATE_EASY_HIGHLIGHTED;
    }
    
    String getButtonState() {
    return buttonState;
  }
}
