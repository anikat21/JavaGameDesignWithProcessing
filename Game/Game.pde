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
String splashBgFile = "images/kingdom.jpg";
PImage splashBg;

//VARIABLES: Menu Screen
Screen menuScreen;
String menuBgFile = "images/kingdom.jpg";
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
int target3Row = 3;
int target3Col = 0;
int health3 = 3;

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
  menuBg = loadImage(splashBgFile);
  menuBg.resize(width, height);
  level1Bg = loadImage(level1BgFile);
  level1Bg.resize(width, height);
  level2Bg = loadImage(level2BgFile);
  level2Bg.resize(width, height);
  level3Bg = loadImage(level3BgFile);
  level3Bg.resize(width, height);
  endBg = loadImage(endBgFile);
  endBg.resize(width, height);
  
  
  //SETUP: Screens, Worlds, Grids
  splashScreen = new Screen("splash", splashBg);
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

    //check if the click was on the target's location??
    if (targetLoc.equals(level1Grid.getMouseGridLocation())){
      
      //Erase image from previous location
      level1Grid.clearTileImage(targetLoc);

      //change the field for the target's row and column
      target1Row = (int) (Math.random()*level1Grid.getNumRows());
      target1Col = (int) (Math.random()*level1Grid.getNumCols());

      //successful click, then add point
      points++;

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
    surface.setTitle(titleText +  "    Total Points: " + points + " Time: " + remainingTime);
  
  }
}

//method to update what is drawn on the screen each frame
public void updateScreen(){

  //UPDATE: Background of the current Screen
  if(currentScreen.getBg() != null){
    background(currentScreen.getBg());
  }

  //UPDATE: SplashScreen
  if( currentScreen == splashScreen){

    if(splashScreen.getScreenTime() > 3000 && splashScreen.getScreenTime() < 5000){
      currentScreen = menuScreen;
    }
  }

  //UPDATE: MenuScreen
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
    remainingTime = 20*1000-(currentScreen.getScreenTime()-startTime);

    //Display the target1 image
    GridLocation target1Loc = new GridLocation(target1Row, target1Col);
    level1Grid.setTileImage(target1Loc, target1);
      
    //update other screen elements
    level1Grid.showImages();
  }
  
  //UPDATE: level2Grid Screen
  if(currentScreen == level2Grid){
    System.out.print("2");
    currentGrid = level2Grid;

    //Display the target2 image
    GridLocation target2Loc = new GridLocation(target2Row, target2Col);
    level2Grid.setTileImage(target2Loc, target2);

    //update other screen elements
    level2Grid.showImages();
    
    //move to next level based on a button click
    // b2.show();
    // if(b2.isClicked()){
    //   System.out.println("\nButton Clicked");
    //   currentScreen = level3Grid;
    // }

  }

  //UPDATE: level3Grid Screen
  if(currentScreen == level3Grid){
    System.out.print("3");
    currentGrid = level3Grid;
    
    //Display the target3 image
    GridLocation target3Loc = new GridLocation(target3Row, target3Col);
    level3Grid.setTileImage(target3Loc, target3);

    //update other screen elements
    level3Grid.showImages();
  }


  //UPDATE: End Screen
  // if(currentScreen == endScreen){

  // }

  //UPDATE: Any Screen



}

//Method to populate enemies or other sprites on the screen
public void populateSprites(){

  //What is the index for the last column?
  

  //Loop through all the rows in the last column

    //Generate a random number


    //10% of the time, decide to add an enemy image to a Tile
    

}

//Method to move around the enemies/sprites on the screen
public void moveSprites(){

//Loop through all of the rows & cols in the grid

      //Store the current GridLocation

      //Store the next GridLocation

      //Check if the current tile has an image that is not player1      


        //Get image/sprite from current location
          

        //CASE 1: Collision with player1


        //CASE 2: Move enemy over to new location


        //Erase image/sprite from old location

        //System.out.println(loc + " " + grid.hasTileImage(loc));

          
      //CASE 3: Enemy leaves screen at first column

}

//Method to check if there is a collision between Sprites on the Screen
public boolean checkCollision(GridLocation loc, GridLocation nextLoc){

  //Check what image/sprite is stored in the CURRENT location
  // PImage image = grid.getTileImage(loc);
  // AnimatedSprite sprite = grid.getTileSprite(loc);

  //if empty --> no collision

  //Check what image/sprite is stored in the NEXT location

  //if empty --> no collision

  //check if enemy runs into player

    //clear out the enemy if it hits the player (using cleartTileImage() or clearTileSprite() from Grid class)

    //Update status variable

  //check if a player collides into enemy

  return false; //<--default return
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
