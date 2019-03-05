class UploadScreen {
  
    final String STATE_YES_HIGHLIGHTED = "Yes?";
    final String STATE_NO_HIGHLIGHTED = "No?";
    
     //initial button state
    String buttonState = STATE_YES_HIGHLIGHTED;
    
    Button YesButton = new Button(STATE_YES_HIGHLIGHTED, 750, 500, 150, 50, color(255, 255, 0), true);
    Button NoButton = new Button(STATE_NO_HIGHLIGHTED, 1100, 500, 150, 50, color(255, 255, 0));
    
    Console c = new Console(10,100,12, 5);
    
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
  
  void keyPressed()
{
         if ((keyAnalyzer(key).compareTo("LETTER") == 0 || keyAnalyzer(key).compareTo("NUMBER") == 0) && !c.isMax())
        {
            c.addChar(key);
        }
        if (keyCode == BACKSPACE)
        {
            c.deleteChar();
        }
        if (keyCode == ENTER) {
          c.reset();
        }
}


    String keyAnalyzer(char c)
    {
        if (c == '0' || c == '1' || c == '2' || c == '3' || c == '4' || c == '5' || c == '6' || c == '7' || c == '8' || c == '9')
        {
            return "NUMBER";
        }
        else if (c == 'A' || c == 'a' || c == 'B' || c == 'b' || c == 'C' || c == 'c' || c == 'D' || c == 'd' || c == 'E' || c == 'e' ||
                 c == 'F' || c == 'f' || c == 'G' || c == 'g' || c == 'H' || c == 'h' || c == 'I' || c == 'i' || c == 'J' || c == 'j' ||
                 c == 'K' || c == 'k' || c == 'L' || c == 'l' || c == 'M' || c == 'm' || c == 'N' || c == 'n' || c == 'O' || c == 'o' ||
                 c == 'P' || c == 'p' || c == 'Q' || c == 'q' || c == 'R' || c == 'r' || c == 'S' || c == 's' || c == 'T' || c == 't' ||
                 c == 'U' || c == 'u' || c == 'V' || c == 'v' || c == 'W' || c == 'w' || c == 'X' || c == 'x' || c == 'Y' || c == 'y' ||
                 c == 'Z' || c == 'z')
        {
            return "LETTER";
        }
        else
        {
            return "OTHER";
        }
    }
  
    class Console
    {
      float x;
      float y;
      String chars;
      int numChars;
      int maxChars;
      boolean active;
      int font;
      
      Console(float x, float y, int font, int mChar)
      {
          this.x = x;
          this.y = y;
          active = false;
          this.font = font;
          chars = "";
          numChars = 0;
          maxChars = mChar;
      }
      
      void display()
      {
          line(x,y,x,y+font);
          textSize(font);
          text(chars,x,y);
      }
      
      void addChar(char c)
      {
          chars += c;
          numChars++;
      }
      
      String readString()
      {
          return chars;
      }
      
      boolean isActive()
      {
          return active;
      }
      
      void activate()
      {
          active = true;
      }
      
      void deactivate()
      {
          active = false;
      }
      
      void reset()
      {
          chars = "";
          numChars = 0;
      }
      
      void deleteChar()
      {
              if (numChars > 0)
              {        
                    chars = chars.substring(0,chars.length()-1);
                    numChars -= 1;
              }
      }
      
      boolean isMax() {
        boolean isMax = false;
        if(numChars >= maxChars) {
          isMax = true;
        }
        return isMax;
      }
  }
}
