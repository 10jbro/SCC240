class ExitScreen
{
  final String STATE_ENDGAME_HIGHLIGHTED = "End Game";
    
  //initial button state
  String buttonState = STATE_ENDGAME_HIGHLIGHTED;
  
  //Button Objects
  Button endGame = new Button(STATE_ENDGAME_HIGHLIGHTED, 1300, 500, 300, 100, color(255, 255, 0),true);
  
  void render()
  {    
      // code for continue screen
      background(102, 153, 51);
      textAlign(CENTER);
      textSize(64);
      fill(255, 255, 255);
      text("Thanks for\nplaying", 1450, 300); //sets position of text and text wording
      
          //Yes button
      endGame.setTextConstraints(1450, 560, 32);
      endGame.render(); 
  }
  
    String getButtonState() {
    return buttonState;
  }
}