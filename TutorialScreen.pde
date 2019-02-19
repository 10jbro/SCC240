class TutorialScreen{
  
  final String STATE_PLAY_HIGHLIGHTED = "Play Game";
  
  //initial button state
  String buttonState = STATE_PLAY_HIGHLIGHTED;
  
 //Button Objects
  Button PlayButton = new Button(STATE_PLAY_HIGHLIGHTED, 650, 720, 380, 140, color(255, 255, 0), true);
  
  void render() {
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
      
      PlayButton.setTextConstraints(850, 810, 64);
      PlayButton.render();
  }
  
}