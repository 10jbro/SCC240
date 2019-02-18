class Button
{
  //variables
  String bText;
  int xLocation, yLocation, bWidth, bHeight, text_Size = 48, textX = 0, textY = 0;
  boolean highlight, initialState = false;
  color neutral_colour = color(255, 255, 255);
  color colour;
  color selected_colour = color(255, 164, 7);  

  //constructor for initialising bText, xLocation, yLocation, bWidth, bHeight, neutral_colour
  Button(String btext, int xLoc, int yLoc, int w, int h, color col)
  {
    bText = btext;
    xLocation = xLoc;
    yLocation = yLoc;
    bWidth = w;
    bHeight = h;
    neutral_colour = col;
    highlight = initialState;
  }
  
  //constructor the same the the above constructor but overides initialState
  Button(String btext, int xLoc, int yLoc, int w, int h, color col, boolean initState)
  {
    initialState = initState;
    bText = btext;
    xLocation = xLoc;
    yLocation = yLoc;
    bWidth = w;
    bHeight = h;
    neutral_colour = col;
    highlight = initialState;
  }
  
  void render()
  {
    if(highlight)
    {     
      colour = selected_colour;    
    }
    else {
      colour = neutral_colour;
    }
    fill(colour);
    rect(xLocation, yLocation, bWidth, bHeight, 7);
    fill(0, 0, 0);
    textSize(text_Size);
    text(bText, textX, textY); //sets position of text and text wording    
  }
  
  void setTextConstraints(int tX, int tY, int textSize)
  {  
    this.textX = tX;
    this.textY = tY;
    this.text_Size = textSize;
  }
  
  void invertHighlight()
  {
    highlight = !highlight;
  }
  
}
