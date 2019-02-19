class LeaderboardScreen {
  
  final String STATE_GOBACK_HIGHLIGHTED = "Go Back to Start Screen";
  
  //initial button state
  String buttonState = STATE_GOBACK_HIGHLIGHTED;
  
  Button goBackButton = new Button(STATE_GOBACK_HIGHLIGHTED, 915, 700, 340, 110, color(255, 255, 0), true);
  
  LeaderboardScreen() {
    
  }
  
  void render(){
  // codes of game screen
  background(102, 153, 51);
  textSize(60);
  fill(0,0,0);
  text("Leaderboard", 900, 100); //sets position of text and text wording
  
  String[] lines = loadStrings("leaderboard.txt");
  if(loadStrings("leaderboard.txt") == null)
  {
    println("file not found");
  }
  else
  {
    println("there are " + lines.length + " lines");
      for (int i = 0 ; i < lines.length; i++) 
      {
        println(lines[i]);
        //String leaderLine = lines[i];
      }
      
      textSize(30);
      text(lines[0], 1050, 250);
      text(lines[1], 1050, 325);
      text(lines[2], 1050, 400);
      text(lines[3], 1050, 475);
      text(lines[4], 1050, 550);
  }
  
  goBackButton.setTextConstraints(1080, 765, 24);
  goBackButton.render();
  }
  
  void changeState_STATE_GOBACK_HIGHLIGHTED() {
    goBackButton.invertHighlight();
    buttonState = STATE_GOBACK_HIGHLIGHTED;
  }
}