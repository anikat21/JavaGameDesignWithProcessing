/* Game Class Starter File
 * Authors: Anika Adity & Naomi Santos Fernandez & Anika Tasmin
 * Last Edit: 5/22/2024
 */

//import processing.sound.*;

//------------------ GAME VARIABLES --------------------//

//VARIABLES: Title Bar
String titleText = " The Fate Of Lux Kingdom ";
String extraText = " The Archery Academy Of Lumina";

//VARIABLES: Splash Screen
Screen splashScreen;
String splashBgFile = "images/test.jpg";
PImage splashBg;

//VARIABLES: Menu Screen
Screen menuScreen;
String menuBgFile = "images/menu.jpg";
PImage menuBg;
Button b1 = new Button("rect", 450, 525, 100, 50, "EASY");
Button b2 = new Button("rect", 550, 525, 100, 50, "MODERATE");
Button b3 = new Button("rect", 650, 525, 100, 50, "HARD");

//VARIABLES: Level1Grid Screen
Grid level1Grid;
PImage level1Bg;
String level1BgFile = "images/mode1.jpg";

PImage target1;
String target1File = "images/target1.png";
int points = 0;
int targetScore= 10;
int target1Row = 3;
int target1Col = 0;
int health = 3;


//VARIABLES: Level2Grid Pixel-based Screen
Grid level2Grid;
PImage level2Bg;
String level2BgFile = "images/mode2.jpg";

PImage target2;
String target2File = "images/target2.png";
int points2 = 0;
int targetScore2 = 20;
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
int targetScore3= 30;
int target3Row = 3;
int target3Col = 0;
int health3 = 3;


//Result Splash Screens (For the plot)
Screen successLvl1;
PImage successLvl1Bg;
String successLvl1BgFile = "images/level1success.jpg";

Screen failLvl1;
PImage failLvl1Bg;
String failLvl1BgFile = "images/level1fail.jpg";

Screen level2Post;
Screen level4Post;
Screen level5Post; 
Screen level6Post;

//VARIABLES: EndScreen
World endScreen;
PImage endBg;
String endBgFile = "images/youwin.png";


//VARIABLES: Whole Game
Screen currentScreen;
Grid currentGrid;
private int msElapsed = 0;
long startTime = 0;
long remainingTime = 20000;
int firstTry = 2000; 
int secondTry = 1500;
int thirdTry = 500; 
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
  
  //SETUP: Screens, Worlds, Grids
  splashScreen = new Screen("splash", splashBg);
  successLvl1 = new Screen("intro School", successLvl1Bg);
  level2Post = new Screen("intro1Boss", null);
  failLvl1 = new Screen("Return1", failLvl1Bg);
  level4Post = new Screen("Return2", null);
  level5Post = new Screen("Final9Boss", null);
  level6Post = new Screen("Return3", null);
  menuScreen = new Screen("menu", menuBg);
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
  
  imageMode(CORNER);    //Set Images to read coordinates at corners
  //fullScreen();   //only use if not using a specfic bg image
  println("Game started...");

} //end setup()

//Required Processing method that automatically loops
//(Anything drawn on the screen should be called from here)
void draw() {

  updateTitleBar();
  updateScreen();

  //simple timing handling
  // if (msElapsed % 300 == 0) {
  //   //sprite handling
  //   populateSprites();
  //   moveSprites();
  // }
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
  
  //check if click was successful
  // System.out.println("Mouse was clicked at (" + mouseX + "," + mouseY + ")");
  // if(currentGrid != null){
  //   System.out.println("Grid location: " + currentGrid.getMouseGridLocation());
  // }

  //what to do if clicked? Move target to a random location??

   //KEYS FOR LEVEL1
  if(currentScreen == level1Grid){

    //Store target GridLocation
    GridLocation targetLoc = new GridLocation(target1Row, target1Col);
// Limit time
 
    //check if the click was on the target's location??
    if (targetLoc.equals(level1Grid.getMouseGridLocation())){
      
      //Erase image from previous location
      level1Grid.clearTileImage(targetLoc);

      //change the field for the target's row and column
      target1Row = (int) (Math.random()*level1Grid.getNumRows());
      target1Col = (int) (Math.random()*level1Grid.getNumCols());

      //successful click, then add point
      points++;
      targetCount ++; 
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
      targetCount ++; 
      //initialize new timer
      startTime = currentScreen.getScreenTime();
    }
  }

  if(currentGrid != null){
    currentGrid.setMark("X",currentGrid.getMouseGridLocation());
  }

}



//------------------ CUSTOM  GAME METHODS --------------------//

//method to update the Title Bar of the Game
public void updateTitleBar(){

  if(!isGameOver()) {
    //set the title each loop
     surface.setTitle(titleText +  "    Total Points XP "  + " Time To Play " );
   
  
    if (currentScreen == level1Grid ){
     surface.setTitle(titleText +  "    Total Points: " + points + " Time: " + (float) (remainingTime)/1000);
    }
    if ( currentScreen == level2Grid ){ 
     surface.setTitle(titleText +  "    Total Points: " + points2 + " Time: " + remainingTime);
    }
    if ( currentScreen== level3Grid ){
       surface.setTitle(titleText +  "    Total Points: " + points3 + " Time: " + remainingTime);
  
    }
  
  }
}

//method to update what is drawn on the screen each frame
public void updateScreen(){

  //UPDATE: Background of the current Screen
  if(currentScreen.getBg() != null){
    background(currentScreen.getBg());
  }

  //UPDATE: SplashScreen
  if(currentScreen == splashScreen){

    if(splashScreen.getScreenTime() > 3000 && splashScreen.getScreenTime() < 5000){
      currentScreen = menuScreen;
    }
  }

  //UPDATE: Menu Screen
  if(currentScreen == menuScreen){

    b1.show();
    b2.show();
    b3.show();

    if(b1.isClicked()){
      currentScreen = level1Grid;

    } else if (b2.isClicked()){
      currentScreen = level2Grid;
    } else if (b3.isClicked()){
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

      targetCount++; 
      startTime = currentScreen.getScreenTime();
    }

    //Display the target1 image
    target1Loc = new GridLocation(target1Row, target1Col);
    level1Grid.setTileImage(target1Loc, target1);
      
    //update other screen elements
    level1Grid.showImages();

    if(targetCount == targetScore){

      if (points == targetScore){
        currentScreen = successLvl1;
      } else { 
        currentScreen = failLvl1;
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

    if(remainingTime <=0 ){
  //Erase image from previous location
      level2Grid.clearTileImage(target2Loc);

      //change the field for the target's row and column
      target2Row = (int) (Math.random()*level2Grid.getNumRows());
      target2Col = (int) (Math.random()*level2Grid.getNumCols());
      startTime = currentScreen.getScreenTime();
 }


    //Display the target2 image
    target2Loc = new GridLocation(target2Row, target2Col);
    level2Grid.setTileImage(target2Loc, target2);

    //update other screen elements
    level2Grid.showImages();


    if (targetCount == targetScore2){

      if (points2 == targetScore2){
        currentScreen = level2Post;
      }
      else { 
        currentScreen = level4Post;
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
 }

    //Display the target3 image
   target3Loc = new GridLocation(target3Row, target3Col);
    level3Grid.setTileImage(target3Loc, target3);

    //update other screen elements
    level3Grid.showImages();
    if (targetCount == targetScore3 ){

      if (points== targetScore3){
      currentScreen = level5Post;
      }
      else { currentScreen = level6Post;}
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
