class QuestionScreen

{

  

  boolean override = false;

  final String STATE_A_HIGHLIGHTED = "A";

  final String STATE_B_HIGHLIGHTED = "B";

  final String STATE_C_HIGHLIGHTED = "C";

  final String STATE_D_HIGHLIGHTED = "D";

  

    //initial button state

  String buttonState;

  

  //Button Objects

  Button QuestionA = new Button(STATE_A_HIGHLIGHTED, 1200, 250, 400, 100, color(255, 255, 0));

  Button QuestionB = new Button(STATE_B_HIGHLIGHTED, 1200, 400, 400, 100, color(255, 255, 0));

  Button QuestionC = new Button(STATE_C_HIGHLIGHTED, 1200, 550, 400, 100, color(255, 255, 0));

  Button QuestionD = new Button(STATE_D_HIGHLIGHTED, 1200, 700, 400, 100, color(255, 255, 0));
  
  PImage[] img = new PImage[3];
 // int[] numbers = new int[3];
 
 void initload(){
   img[0] = loadImage("./tutorialImages/scarecrowStart.png");
 }


  

  void render()

  {
    startTimer.countDown();

      //code for question screen

      background(102, 153, 51);

      textAlign(CENTER);

      textSize(64);

      fill(255, 255, 255);

      text(questions[0], 1400, 200); //sets position of text and text wording

      
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

      rect(50, 200, 1000, 600, 7);

      fill(0, 0, 0);
      image(img[0], 50, 200, 1000, 600);

      text("Character Animations", 550, 500); //sets position of text and text wording

      

      QuestionA.setTextConstraints(1240, 320, 64);

      QuestionB.setTextConstraints(1240, 470, 64);

      QuestionC.setTextConstraints(1240, 620, 64);

      QuestionD.setTextConstraints(1240, 770, 64);

      

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

  

  boolean getOverride()

  {

    return override;

  }  

  

    String getButtonState() {

    return buttonState;

  }

}
