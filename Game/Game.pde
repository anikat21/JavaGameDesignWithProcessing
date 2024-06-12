import processing.sound.*;

/* Game Class Starter File
 * Authors: Anika Adity & Naomi Santos Fernandez & Anika Tasmin
 * Last Edit: 5/22/2024
 */


//------------------ GAME VARIABLES --------------------//

//VARIABLES: Title Bar
String titleText = " The Fate Of Lux Kingdom ";
String extraText = " The Archery Academy Of Lumina";

//VARIABLES: Splash Screen
Screen splashScreen;
String splashBgFile = "images/mainbg.png";
PImage splashBg;
Button playButton = new Button("rect", 50, 525, 100, 50, "PLAY");

//VARIABLES: Menu Screen
Screen menuScreen;
String menuBgFile = "images/menu.png";
PImage menuBg;
Button easyButton = new Button("rect", 450, 525, 100, 50, "EASY");
Button modButton = new Button("rect", 550, 525, 100, 50, "MODERATE");
Button hardButton = new Button("rect", 650, 525, 100, 50, "HARD");

//VARIABLES: Level Screen (Rules/Objective)
Screen level1Screen;
String level1ScreenBgFile = "images/level1screen.png";
PImage level1ScreenBg;

Screen level2Screen;
String level2ScreenBgFile = "images/level2screen.png";
PImage level2ScreenBg;

Screen level3Screen;
String level3ScreenBgFile = "images/level3screen.png";
PImage level3ScreenBg;

Button menuButton = new Button("rect", 550, 525, 100, 50, "MENU");
Button level1Button = new Button("rect", 650, 525, 100, 50, "RANGE");
Button level2Button = new Button("rect", 650, 525, 100, 50, "DUNGEON");
Button level3Button = new Button("rect", 650, 525, 100, 50, "FINAL BOSS");

//VARIABLES: Level1Grid Screen
Grid level1Grid;
PImage level1Bg;
String level1BgFile = "images/mode1.jpg";

PImage target1;
String target1File = "images/target1.png";
int points = 0;
int targetScore = 20;
int target1Row = 3;
int target1Col = 0;
int health = 3;

//level 1 sound 
SoundFile file;

//VARIABLES: Level2Grid Pixel-based Screen
Grid level2Grid;
PImage level2Bg;
String level2BgFile = "images/mode2.jpg";

PImage target2;
String target2File = "images/target2.png";
int points2 = 0;
int targetScore2 = 30;
int target2Row = 3;
int target2Col = 0;
int health2 = 3;

//VARIABLES: Level3Grid Pixel-based Screen
Grid level3Grid;
PImage level3Bg;
String level3BgFile = "images/mode3.jpg";

PImage target3;
String target3File = "images/target3.png";
int points3 = 0;
int targetScore3= 20;
int target3Row = 3;
int target3Col = 0;
int health3 = 3;


//VARIABLES: Result Splash Screens (For the plot)
Screen successLvl1;
PImage successLvl1Bg;
String successLvl1BgFile = "images/level1success.png";

Screen failLvl1;
PImage failLvl1Bg;
String failLvl1BgFile = "images/level1fail.png";

Screen successLvl2;
PImage successLvl2Bg;
String successLvl2BgFile = "images/level2success.png";

Screen failLvl2;
PImage failLvl2Bg;
String failLvl2BgFile = "images/level2fail.png";

Screen successLvl3;
PImage successLvl3Bg;
String successLvl3BgFile = "images/level3success.png";

Screen failLvl3;
PImage failLvl3Bg;
String failLvl3BgFile = "images/level3fail.png";

//VARIABLES: EndScreen
World endScreen;
PImage endBg;
String endBgFile = "images/mainbg.png";


//VARIABLES: Whole Game
Screen currentScreen;
Grid currentGrid;
private int msElapsed = 0;
long startTime = 0;
long remainingTime = 20000;
int firstTry = 2000; 
int secondTry = 1500;
int thirdTry = 1000; 
int targetCount= 0; 

//------------------ REQUIRED PROCESSING METHODS --------------------//

//Required Processing method that gets run once
void setup() {

  //SETUP: Match the screen size to the background image size
  size(800,600);  //these will automatically be saved as width & height
  imageMode(CORNER);    //Set Images to read coordinates at corners
  //fullScreen();   //only use if not using a specfic bg image
  
  
  //SETUP: Set the title on the title bar
  surface.setTitle(titleText);

  //SETUP: Load BG images used in all screens
  splashBg = loadImage(splashBgFile);
  splashBg.resize(width, height);

  menuBg = loadImage(menuBgFile);
  menuBg.resize(width, height);

  level1Bg = loadImage(level1BgFile);
  level1Bg.resize(width, height);
  level2Bg = loadImage(level2BgFile);
  level2Bg.resize(width, height);
  level3Bg = loadImage(level3BgFile);
  level3Bg.resize(width, height);

  endBg = loadImage(endBgFile);
  endBg.resize(width, height);

  successLvl1Bg = loadImage(successLvl1BgFile);
  successLvl1Bg.resize(width, height);
  failLvl1Bg = loadImage(failLvl1BgFile);
  failLvl1Bg.resize(width, height);
  successLvl2Bg = loadImage(successLvl2BgFile);
  successLvl2Bg.resize(width, height);
  failLvl2Bg = loadImage(failLvl2BgFile);
  failLvl2Bg.resize(width, height);
  successLvl3Bg = loadImage(successLvl3BgFile);
  successLvl3Bg.resize(width, height);
  failLvl3Bg = loadImage(failLvl3BgFile);
  failLvl3Bg.resize(width, height);

  level1ScreenBg = loadImage(level1ScreenBgFile);
  level1ScreenBg.resize(width, height);
  level2ScreenBg = loadImage(level2ScreenBgFile);
  level2ScreenBg.resize(width, height);
  level3ScreenBg = loadImage(level3ScreenBgFile);
  level3ScreenBg.resize(width, height);
  
  //SETUP: Screens, Worlds, Grids
  splashScreen = new Screen("splash", splashBg);

  successLvl1 = new Screen("intro academy", successLvl1Bg);
  failLvl1 = new Screen("return to level 1", failLvl1Bg);
  successLvl2 = new Screen("intro to harbingers", successLvl2Bg);
  failLvl2 = new Screen("return to level 2", failLvl2Bg);
  successLvl3 = new Screen("intro to final boss", successLvl3Bg);
  failLvl3 = new Screen("return to level 3", failLvl3Bg);
 
  menuScreen = new Screen("menu", menuBg);

  level1Screen = new Screen("rules level1", level1ScreenBg);
  level2Screen = new Screen("rules level2", level2ScreenBg);
  level3Screen = new Screen("rules level3", level3ScreenBg);

  level1Grid = new Grid("academy", level1Bg, 6, 8);
  level2Grid = new Grid("dungeon", level2Bg, 6, 8);
  level3Grid = new Grid("boss", level3Bg, 6, 8);

  endScreen = new World("end", endBg);
  currentScreen = splashScreen;
  
  //SETUP: Level 1
  target1 = loadImage(target1File);
  target1.resize(level1Grid.getTileWidth(), level1Grid.getTileHeight());
  System.out.println("Done loading Level 1 ...");
  
  //SETUP: Level 2
  target2 = loadImage(target2File);
  target2.resize(level2Grid.getTileWidth(), level2Grid.getTileHeight());
  System.out.println("Done loading Level 2 ...");
  
  //SETUP: Level 3
  target3 = loadImage(target3File);
  target3.resize(level2Grid.getTileWidth(), level3Grid.getTileHeight());
  System.out.println("Dont loading level 3 ...");

  //SETUP: Sound
  // Load a soundfile from the /data folder of the sketch and play it back
  // song = new SoundFile(this, "sounds/Lenny_Kravitz_Fly_Away.mp3");
  // song.play();
  
  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "sounds/level1.mp3");
  file.play();

  
  imageMode(CORNER);    //Set Images to read coordinates at corners
  //fullScreen();   //only use if not using a specfic bg image
  println("Game started...");

} //end setup()

//Required Processing method that automatically loops
//(Anything drawn on the screen should be called from here)
void draw() {

  updateTitleBar();
  updateScreen();
  msElapsed +=10;
  currentScreen.pause(10);

  //check for end of game
  if(isGameOver()){
    endGame();
  }

} //end draw()

//------------------ USER INPUT METHODS --------------------//


//Known Processing method that automatically will run whenever a key is pressed
void keyPressed(){

  //check what key was pressed
  System.out.println("Key pressed: " + key); //keyCode gives you an integer for the key

  //What to do when a key is pressed?
  
  //KEYS FOR LEVEL1
  if(currentScreen == level1Grid){

    if(keyCode == 87){
    
    }



  }

  //CHANGING SCREENS BASED ON KEYS
  //change to level1 if 1 key pressed, level2 if 2 key is pressed
  if(key == '1'){
    currentScreen = level1Grid;
  } else if(key == '2'){
    currentScreen = level2Grid;
  } else if(key == '3'){
    currentScreen = level3Grid;
  } else if(key == 'm'){
    currentScreen = menuScreen;
  }

}

//Known Processing method that automatically will run when a mouse click triggers it
void mouseClicked(){

  //what to do if clicked? Move target to a random location??

   //KEYS FOR LEVEL1
  if(currentScreen == level1Grid){

    //Store target GridLocation
    GridLocation targetLoc = new GridLocation(target1Row, target1Col);

    //check if the click was on the target's location??
    if (targetLoc.equals(level1Grid.getMouseGridLocation())){
      
      //Erase image from previous location
      level1Grid.clearTileImage(targetLoc);

      //change the field for the target's row and column
      target1Row = (int) (Math.random()*level1Grid.getNumRows());
      target1Col = (int) (Math.random()*level1Grid.getNumCols());

      //successful click, then add point
      points++;
      targetCount++;

      //initialize new timer
      startTime = currentScreen.getScreenTime();
    }
  }

  //KEYS FOR LEVEL2
  if(currentScreen == level2Grid){

    //Store target GridLocation
    GridLocation targetLoc2 = new GridLocation(target2Row, target2Col);

    //check if the click was on the target's location??
    if (targetLoc2.equals(level2Grid.getMouseGridLocation())){
      
      //Erase image from previous location
      level2Grid.clearTileImage(targetLoc2);

      //change the field for the target's row and column
      target2Row = (int) (Math.random()*level2Grid.getNumRows());
      target2Col = (int) (Math.random()*level2Grid.getNumCols());

      //successful click, then add point
      points2++;
      targetCount++;

      //initialize new timer
      startTime = currentScreen.getScreenTime();
    }
  }

  //KEYS FOR LEVEL3
  if(currentScreen == level3Grid){

    //Store target GridLocation
    GridLocation targetLoc3 = new GridLocation(target3Row, target3Col);

    //check if the click was on the target's location??
    if (targetLoc3.equals(level3Grid.getMouseGridLocation())){
      
      //Erase image from previous location
      level3Grid.clearTileImage(targetLoc3);

      //change the field for the target's row and column
      target3Row = (int) (Math.random()*level3Grid.getNumRows());
      target3Col = (int) (Math.random()*level3Grid.getNumCols());

      //successful click, then add point
      points3++;
      targetCount++;

      //initialize new timer
      startTime = currentScreen.getScreenTime();
    }
  }

  if(currentGrid != null){
    currentGrid.setMark("X",currentGrid.getMouseGridLocation());
  }

}



//------------------ CUSTOM  GAME METHODS --------------------//

//Method to update the Title Bar of the Game
public void updateTitleBar(){

  if(!isGameOver()) {
    //set the title each loop
     surface.setTitle(titleText +  "    Total Points XP "  + " Time To Play " );
   
  
    if (currentScreen == level1Grid ){
     surface.setTitle(titleText +  "    Total Points: " + points + " Time: " + (float) (remainingTime)/1000);
    }
    if (currentScreen == level2Grid ){ 
     surface.setTitle(titleText +  "    Total Points: " + points2 + " Time: " + remainingTime);
    }
    if (currentScreen== level3Grid ){
       surface.setTitle(titleText +  "    Total Points: " + points3 + " Time: " + remainingTime);
  
    }
  
  }
}

//Method to update 

//method to update what is drawn on the screen each frame
public void updateScreen(){

  //UPDATE: Background of the current Screen
  if(currentScreen.getBg() != null){
    background(currentScreen.getBg());
  }

  //UPDATE: SplashScreen
  if(currentScreen == splashScreen){
    playButton.show();
    
    if(playButton.isClicked()){
      currentScreen = menuScreen;
    }
  }

  //UPDATE: Menu Screen
  if(currentScreen == menuScreen){
    easyButton.show();
    modButton.show();
    hardButton.show();

    if(easyButton.isClicked()){
      currentScreen = level1Screen;
    } else if(modButton.isClicked()){
      currentScreen = level2Screen;
    } else if(hardButton.isClicked()){
      currentScreen = level3Screen;
    }
  }

  //UPDATE: Level1Screen, Level2Screen, Level3Screen (Rules/Objective)
  if(currentScreen == level1Screen){
    level1Button.show();

    if(level1Button.isClicked()){
      currentScreen = level1Grid;
    }
  }

  if(currentScreen == level2Screen){
    level2Button.show();

    if(level2Button.isClicked()){
      currentScreen = level2Grid;
    }
  }

  if(currentScreen == level3Screen){
    level3Button.show();

    if(level3Button.isClicked()){
      currentScreen = level3Grid;
    }
  }

  //UPDATE: Buttons for other screen elements (fail/success endings)
  if(currentScreen == successLvl1){
    level2Button.show();
    if(level2Button.isClicked()){
      currentScreen = level2Grid;
    }
  }
  
  if (currentScreen == failLvl1){
    level1Button.show();
    if(level1Button.isClicked()){
      currentScreen = level1Grid;
    }
  }

  if(currentScreen == successLvl2){
    level3Button.show();
    if(level3Button.isClicked()){
      currentScreen = level3Grid;
    }
  }

  if(currentScreen == failLvl2){
    level2Button.show();
    if(level2Button.isClicked()){
      currentScreen = level2Grid;
    }
  }

  if(currentScreen == successLvl3){
    playButton.show();
    if(playButton.isClicked()){
      currentScreen = splashScreen;
    }
  }

  if(currentScreen == failLvl3){
    level3Button.show();
    if(level3Button.isClicked()){
      currentScreen = level3Grid;
    }
  }

  //UPDATE: level1Grid Screen
  if(currentScreen == level1Grid){
    System.out.print("1");
    currentGrid = level1Grid;

    //update timer target1
    remainingTime = firstTry-(currentScreen.getScreenTime()-startTime);

    GridLocation target1Loc = new GridLocation(target1Row, target1Col);

    if(remainingTime <= 0){
      //Erase image from previous location
      level1Grid.clearTileImage(target1Loc);

      //change the field for the target's row and column
      target1Row = (int) (Math.random()*level1Grid.getNumRows());
      target1Col = (int) (Math.random()*level1Grid.getNumCols());
      startTime = currentScreen.getScreenTime();

      //counter
      //targetCount++;
    }

    //Display the target1 image
    target1Loc = new GridLocation(target1Row, target1Col);
    level1Grid.setTileImage(target1Loc, target1);
      
    //update other screen elements
    level1Grid.showImages();

    if(targetCount == targetScore){
      if (points == targetScore){
        currentScreen = successLvl1;
        targetCount = 0;
      } else { 
        currentScreen = failLvl1;
        targetCount = 0;
      }
    }
  }
  
  //UPDATE: level2Grid Screen
  if(currentScreen == level2Grid){
    System.out.print("2");
    currentGrid = level2Grid;

    //update timer target2
    remainingTime = secondTry-(currentScreen.getScreenTime()-startTime);

    GridLocation target2Loc = new GridLocation(target2Row, target2Col);

    if(remainingTime <= 0){
      //Erase image from previous location
      level2Grid.clearTileImage(target2Loc);

      //change the field for the target's row and column
      target2Row = (int) (Math.random()*level2Grid.getNumRows());
      target2Col = (int) (Math.random()*level2Grid.getNumCols());
      startTime = currentScreen.getScreenTime();

      //counter
      //targetCount++;
 }

    //Display the target2 image
    target2Loc = new GridLocation(target2Row, target2Col);
    level2Grid.setTileImage(target2Loc, target2);

    //update other screen elements
    level2Grid.showImages();

    if (targetCount == targetScore2){
      if (points2== targetScore2){
        currentScreen = successLvl2;
        targetCount = 0;
      } else { 
        currentScreen = failLvl2;
        targetCount = 0;
      }
    }
  }

  //UPDATE: level3Grid Screen
  if(currentScreen == level3Grid){
    System.out.print("3");
    currentGrid = level3Grid;
    
  //update timer target3
    remainingTime = thirdTry-(currentScreen.getScreenTime()-startTime);

    GridLocation target3Loc = new GridLocation(target3Row, target3Col);

    if(remainingTime <=0 ){
      //Erase image from previous location
      level3Grid.clearTileImage(target3Loc);

      //change the field for the target's row and column
      target3Row = (int) (Math.random()*level3Grid.getNumRows());
      target3Col = (int) (Math.random()*level3Grid.getNumCols());
      startTime = currentScreen.getScreenTime();

      //counter
      //targetCount++;
 }

    //Display the target3 image
    target3Loc = new GridLocation(target3Row, target3Col);
    level3Grid.setTileImage(target3Loc, target3);

    //update other screen elements
    level3Grid.showImages();
    if (targetCount == targetScore3 ){
      if (points== targetScore3){
        currentScreen = successLvl3;
        targetCount = 0;
      } else {
        currentScreen = failLvl3;
        targetCount = 0;
      }
    }
  }


  //UPDATE: End Screen
  // if(currentScreen == endScreen){

  // }

  //UPDATE: Any Screen



}

//method to indicate when the main game is over
public boolean isGameOver(){
  
  return false; //by default, the game is never over
}

//method to describe what happens after the game is over
public void endGame(){
    System.out.println("Game Over!");

    //Update the title bar

    //Show any end imagery
    currentScreen = endScreen;

}
