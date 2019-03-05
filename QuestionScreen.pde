class QuestionScreen
{

  boolean override = false;

  String STATE_A_HIGHLIGHTED = "A";

  String STATE_B_HIGHLIGHTED = "B";

  String STATE_C_HIGHLIGHTED = "C";

  String STATE_D_HIGHLIGHTED = "D";

    //initial button state  

  String buttonState;

  //Button Objects

  Button QuestionA;
  Button QuestionB;
  Button QuestionC;
  Button QuestionD;
  
  PImage[] img = new PImage[3];
 // intc[] numbers = new int[3];
 
 void initload()
 {
   img[0] = loadImage("./tutorialImages/scarecrowStart.png");
   
   img[1] = loadImage("./tutorialImages/background.png");
 }

  void setQuestions(int round)
  {
      if (round == 1)
      {
           
      }
  }
  void render()
  {
    startTimer.countDown();
    
    //qload();

      //code for question screen

      background(102, 153, 51);

      textAlign(CENTER);

      textSize(36);

      fill(255, 255, 255);

      text(questions[0], 390, 180); //sets position of text and text wording

      
      //lives
      fill(0, 255, 0);

      ellipse(60, 60, 100, 100);

      ellipse(170, 60, 100, 100);

      ellipse(280, 60, 100, 100);

      //help
      fill(0, 200, 255);

      ellipse(1650, 60, 100, 100);

      

      fill(255, 255, 255);

      textSize(32);

      text("Time: "+ startTimer.getTime(), 400, 50); //sets position of text and text wording

      text("Score: ", 400, 90); //sets position of text and text wording

      text("Round 1 ", 1500, 70); //sets position of text and text wording

      

      fill(255, 255, 255);

      rect(50, 200, 1000, 600, 2);

      fill(0, 0, 0);
      
      image(img[1], 51, 201, 999, 599); //background image
      
      image(img[0], 320, 270, 700, 500); //initial character position
      
      
      QuestionA = new Button(STATE_A_HIGHLIGHTED, 1200, 250, 400, 100, color(255, 255, 0));

      QuestionB = new Button(STATE_B_HIGHLIGHTED, 1200, 400, 400, 100, color(255, 255, 0));
    
      QuestionC = new Button(STATE_C_HIGHLIGHTED, 1200, 550, 400, 100, color(255, 255, 0));
    
      QuestionD = new Button(STATE_D_HIGHLIGHTED, 1200, 700, 400, 100, color(255, 255, 0));
      

      

      QuestionA.setTextConstraints(1300, 320, 32);

      QuestionB.setTextConstraints(1300, 470, 32);

      QuestionC.setTextConstraints(1300, 620, 32);

      QuestionD.setTextConstraints(1300, 770, 32);
     
      
      QuestionA.render(); 

      QuestionB.render(); 

      QuestionC.render(); 

      QuestionD.render();     
  }

  

  void changeState_STATE_A_HIGHLIGHTED() 

  {   

    QuestionB.invertHighlight();

    QuestionA.invertHighlight();

    buttonState = STATE_A_HIGHLIGHTED;

  }

  

  void changeState_STATE_B_HIGHLIGHTED() 

  {

    if (buttonState.equals(STATE_A_HIGHLIGHTED))

    {

      QuestionA.invertHighlight();

    }

    else

    {

      QuestionC.invertHighlight();

    }

    QuestionB.invertHighlight();

    buttonState = STATE_B_HIGHLIGHTED;

  }

  

  void changeState_STATE_C_HIGHLIGHTED() 

  {

    if (buttonState.equals(STATE_B_HIGHLIGHTED))

    {

      QuestionB.invertHighlight();

    }

    else

    {

      QuestionD.invertHighlight();

    }

    QuestionC.invertHighlight();

    buttonState = STATE_C_HIGHLIGHTED;

  }

  

  void changeState_STATE_D_HIGHLIGHTED() 

  {

    QuestionC.invertHighlight();

    QuestionD.invertHighlight();

    buttonState = STATE_D_HIGHLIGHTED;

  }

  

  void overrideToJoystick()

  {

    QuestionA.invertHighlight();

    buttonState = STATE_A_HIGHLIGHTED;

    override = true;

  }
  
  void setQuestions(String a, String b, String c, String d)
  {
      STATE_A_HIGHLIGHTED = a;

      STATE_B_HIGHLIGHTED = b;

      STATE_C_HIGHLIGHTED = c;

      STATE_D_HIGHLIGHTED = d;
  }

  

  boolean getOverride()

  {

    return override;

  }  

  

    String getButtonState() {

    return buttonState;

  }

}