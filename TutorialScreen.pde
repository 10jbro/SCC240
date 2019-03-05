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
      textSize(32);
      text("to select\noption A", 300, 500); //sets position of text and text wording
      
      PImage img1;
      img1 = loadImage("tutorialImages/clap.png");
      image(img1, 150, 200);
    
      //Tap
      textSize(32);
      text("to select\noption B", 650, 500); //sets position of text and text wording
      
      PImage img2;
      img2 = loadImage("tutorialImages/tap.png");
      image(img2, 470, 200);
      
      //Breathe
      textSize(32);
      text("to select\noption C", 1050, 500); //sets position of text and text wording
      
      PImage img3;
      img3 = loadImage("tutorialImages/breathe.png");
      image(img3, 900, 260);
      
      //Photo-resistor
      textSize(32);
      text("to select\noption D", 1420, 500); //sets position of text and text wording
      PImage img4;
      img4 = loadImage("tutorialImages/cover.png");
      image(img4, 1260, 230);
      
      textSize(32);
      fill(255,255,255);
      text("Want to play the old-fashioned way? Move the joystick to select your chosen answer and click to answer.", 850, 650); //sets position of text and text wording
      
      PlayButton.setTextConstraints(850, 810, 64);
      PlayButton.render();
  }
  
}
