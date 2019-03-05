class LeaderboardScreen {
  
  IntDict inventory;
  String[] keys;
  int[] values;
  
  final String STATE_GOBACK_HIGHLIGHTED = "Go Back to Start Screen";
  
  //initial button state
  String buttonState = STATE_GOBACK_HIGHLIGHTED;
  
  Button goBackButton = new Button(STATE_GOBACK_HIGHLIGHTED, 915, 700, 340, 110, color(255, 255, 0), true);
  
   PImage[] img = new PImage[3];
 
   void initload(){
     img[0] = loadImage("./tutorialImages/scarecrowStart.png");
   }
  
  LeaderboardScreen() {
    
  }
  
  void render(){
  // codes of game screen
  background(102, 153, 51);
  textSize(60);
  fill(0,0,0);
  text("Leaderboard", 900, 100); //sets position of text and text wording
  
  image(img[0], 50, 200, 1000, 600);
  
    inventory = new IntDict();
  
    this.populateInventory();
    inventory.sortValuesReverse();
    
    this.makeArray(inventory.size());
      
      textSize(30);
      text("Name: "+ keys[0] + " || " + "Score: " + inventory.get(keys[0]), 1050, 250);
      text("Name: "+ keys[1] + " || " + "Score: " + inventory.get(keys[1]), 1050, 325);
      text("Name: "+ keys[2] + " || " + "Score: " + inventory.get(keys[2]), 1050, 400);
      text("Name: "+ keys[3] + " || " + "Score: " + inventory.get(keys[3]), 1050, 475);
      text("Name: "+ keys[4] + " || " + "Score: " + inventory.get(keys[4]), 1050, 550);
  
      goBackButton.setTextConstraints(1085, 765, 24);
      goBackButton.render();
  }
  
  void changeState_STATE_GOBACK_HIGHLIGHTED() {
    goBackButton.invertHighlight();
    buttonState = STATE_GOBACK_HIGHLIGHTED;
  }

  void populateInventory() {
    
    String[] lines = loadStrings("leaderboard.txt");
    if(loadStrings("leaderboard.txt") == null)
    {
      println("file not found");
    }
    else
    {
      //println("there are " + lines.length + " lines");
      for (int i = 0 ; i < lines.length; i++) 
      {
        inventory.set(lines[i].substring(0, lines[i].indexOf(",")),
          Integer.parseInt(lines[i].substring(lines[i].indexOf(",") + 1))
        );
      }
    }
  }

  void makeArray(int size) {
    keys = new String[size];
    keys = inventory.keyArray();
  }
}
