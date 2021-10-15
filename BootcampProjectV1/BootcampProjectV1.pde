int Screen; //Changing Title screen to game itself
float Antx;
float Anty;
PImage table;
int HitCheck; //HitCheck used as timer for animation of slipper
float TimerHit; //TimerHit used to make animation much more realistic
float SlipperX;
float SlipperY;
int Score;
PFont Competition;
PFont Title;

void setup()
{
  
  table = loadImage("table1.jpg");
  noCursor(); //Turning off this ugly thing in the game
  size(3000,1500);
  Antx = width/2;
  Anty = height/2;
  HitCheck = 0;
  Screen = 0;
  
  
}

void draw(){
    
if(Screen == 0){
  background(255);
  Competition = createFont("Georgia", 32);
  textFont(Competition);
  fill(0,0,0);
  textAlign(CENTER, CENTER);
  text("Press mouse button to start", width/2, height/2);
  
  Title = createFont("Arial", 68);
  textFont(Title);
  fill(0,0,0);
  textAlign(CENTER, BOTTOM);
  text("Hit Your Frienly Fly", width/2, height/6);
}  
  
if(Screen == 1){  
  
  background(255, 0, 0);

  image(table, 109, 109);
  
  // Text for counting how many times you hit fly with the slipper
  Competition = createFont("Georgia", 32);
  textFont(Competition);
  fill(0, 255, 0);
  text("Score: " + Score, width-width/4, height/8);
  
  //Initialy fly was ant, thats why variables for random movement of fly called Antx and Anty 
  float smoothness = 0.005;
  Antx = noise(frameCount*smoothness,0)*width;
  Anty = noise(frameCount*smoothness,1)*height;
  fill(0);
  circle(Antx, Anty,50);
  
  
  // Those are if functions to check if we should draw slipper shadow outside the scetch.
  if(mouseX < 109 || mouseX > width-139 || mouseY < 109 || mouseY > height-159){
      noStroke();
      fill(0, 0, 0, 0);
  }
  else {
  fill(0, 0, 0, 150);
  }
  //Next 2 lines check if we need to draw shadow of the Slipper if we have it already hitting a fly.
  if (HitCheck == 0){
    rect(mouseX-65, mouseY-80, 130, 160, 75, 75, 50, 50);
  }
  
  
  if (HitCheck == 2){
  HitCheck = 0;
  TimerHit=0;
  }
  
   //This is animation of the hit
   if(HitCheck > 0){
     // Clouds after Hit effect
     fill(255, 255, 255, 150);
     ellipse(SlipperX-65 - TimerHit*2, SlipperY - 40 - TimerHit/2, 100, 75-TimerHit);
     ellipse(SlipperX-65 - TimerHit*2, SlipperY + 40 - TimerHit/2, 100, 75-TimerHit);
     ellipse(SlipperX+65 + TimerHit*2, SlipperY - 40 - TimerHit/2, 100, 75-TimerHit);
     ellipse(SlipperX+65 + TimerHit*2, SlipperY + 40 - TimerHit/2, 100, 75-TimerHit);
     ellipse(SlipperX, SlipperY - 70 - TimerHit*2, 100, 75-TimerHit);
     ellipse(SlipperX, SlipperY + 70 + TimerHit*2, 100, 75-TimerHit);
     
     // Slipper effect
     fill(0, 0, 255);
     rect(SlipperX-65, SlipperY-80, 130, 200, 75, 75, 50, 50);  
     fill(0, 255, 0);
     triangle(SlipperX - 65, SlipperY - 40, SlipperX - 65, SlipperY + 20, SlipperX + 65, SlipperY - 40);
     
     
     TimerHit++;
          if(TimerHit/30 == 1 || TimerHit/60 == 2 || TimerHit/60 == 3){
          HitCheck++;
   }
   }

}
}

void mousePressed() {
  
 if(Screen == 0){
   Screen++;
 } 
  
 if(Screen == 1){ 
  
 if(HitCheck == 0){
     if(mouseX < 109 || mouseX > width-139 || mouseY < 109 || mouseY > height-159)
     {
       HitCheck = 0;
     }  
     else{
   HitCheck++;
   SlipperX = mouseX;
   SlipperY = mouseY;
 }
 
 // Increasing score if we hit the fly
 if(SlipperX +65 > Antx-25 && SlipperX - 65 < Antx && SlipperY - 100 < Anty && SlipperY + 100 > Anty){
 Score++;
 }
}
 }
}
