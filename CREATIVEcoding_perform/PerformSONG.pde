float [] pt; 
float csz = 400;
float grosor = 150;
int cf = 1;
int scene = 1;
float angle = 45;
int i = 1;
float yoff = 0;
//PImage img;
PImage[] seqD = new PImage[63];
int total = 63;
int cframe = 0;

void setup(){
fullScreen();

frameRate(12);
background (255);
size (1536,2048);
//img = loadImage("rain.jpg");

 for (int i = 0; i < 63; i++) {
    
    int fotoNumber = i + 1;
    print("danceB" + str(fotoNumber) + ".png");
    seqD[i] = loadImage("danceB" + str(fotoNumber) + ".png");
  
  
  }
}

void draw(){
  
  if(cf == 15){
   
     fill(255,255,255);
     fill (random(250),random(50),random(150,255),random(10,50));
     noStroke();
     circle (random(3000),random(500),random(600));
     circle (random(3000),random(1500),random(50,200));
     cf = 1;
     
      if (scene ==6){
   
   //frameRate(8);
    fill (mouseX*0.5,random(mouseY*0.2,150),random(255));
     circle (random(width),random(height),random(100));
     circle (random(1200),random(1000),random(50,100));
     //fill(255,255,255,10);
     fill (random(100,255),random(150,255),random(255));
     noStroke();
     circle (random(2000),random(500),random(500));
     fill (random(100),random(255),random(100));
     circle (random(width),random(height),random(100,200));
     }
     
    }
    cf = cf +1;
      
  
 if (scene ==1){
   //RADIAL CIRCLE
 fill(255,255,255,20);
 stroke (random(150,255),random(100,150),random(150,255));
 noFill();
 strokeWeight(grosor);
 csz = csz + 10;
 circle(width/2, height/2,csz);
 if (csz>width){
 csz=random(0,50);
 grosor = random(130,380); 
   }
 }

if (scene ==2 ){
//  ARCS FOREST
 fill(150*(mouseX+0.5),random(mouseX*0.1,255),random(0,100));
 noStroke();
 arc(random(mouseX*0.5,width), mouseY+(height/3),random(50,500),random(150,800),PI, TWO_PI);
 }


if (scene ==3){   //TRIANGLES
  
  //READ IMAGE SEQUENCE
   cframe = (cframe+1) % total;
  int offset = 0;
  for(int x = 100; x < width; x += seqD[0].width )
{  
   image (seqD[(cframe+offset)%total], x, -20);
  offset += 2;
  
  image (seqD[(cframe+offset)%total],x, (height/2)+70);
  offset += 2;
 }
// SHAPE TO HIDE PREVIOUS IMAGES WITH ALPHA
fill(255,255,255,95);
 rect(0, 0,width,height);
 
 //DRAW TRIANGLES
   fill(random(255),255,random(100,255),random(20,60));
  triangle (mouseX,mouseY,random(300), height/2, random(500),random(300));
  //fill(255,255,255,30);
  fill (random(150),40,random(255),random(40));
  noStroke();
  triangle (random(300),mouseY,width/2,random(800),mouseX,mouseY); 
  
  
   }
  


if (scene == 4){
//LINE MOVING
pushMatrix();
stroke(random(80,180),random(255),random(100));
strokeWeight (12);
translate (mouseX, mouseY);
rotate(radians(angle));
line(width/3,height/3,mouseX*0.5, mouseY*0.8);

popMatrix();
angle=300*sin(frameCount*0.005);  
}


if (scene ==5){  //RADIAL LINES width
smooth();
noStroke();
fill(255,255,255,10);
   fill(random(50,200), frameCount * 5 % 150,
      frameCount * 7 % 255,random(20,70));
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(frameCount * 1));
    rect((0+i)*0.05, (0+i)*0.01, random(mouseX*0.5,450), random(mouseY*0.2));
    popMatrix();
    i++;
    fill(220,10);
 }
 

 if (scene == 7) {  //RADIO WAVES WITH INTERACTIVE ANIMATION
   
  cframe = (cframe+1) % total;
  int offset = 0;
  for(int x = -100; x < width; x += seqD[0].width ){  
  image (seqD[(cframe+offset)%total], (x+mouseX)*0.8, -40);
  offset += 2;
  image (seqD[(cframe+offset)%total], x+mouseY, -50);
  offset += 2;
}

//DRAW SQ TO COVER PREVIOUS IMAGES
fill(255,255,255,90);
 rect(0, 0,width,height);
  
 beginShape(); 
  fill (random(80),random(50,255),random(100,255),80);
  stroke (255,70);
  strokeWeight(1);
    float xoff = 0;       
    for (float x = 0; x <= width; x += 10) {
      float y = map(noise(xoff, yoff), 0, 1, 400,1000); 
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.1;
    }
  // increment y dimension for noise
  yoff += 0.2;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE); 
  



angle=300*sin(frameCount*00.005);

   
 }

} 
 


void keyPressed()
{
 if (key == 'b'){
 background (255);
 csz=0;
 }
 
if (key == 'i'){filter(INVERT);}  

if (key == 'c'){scene = 0;}
if (key == '1'){scene=1; }  
if (key == '2'){scene=2; }    
if (key == '3'){scene=3; } 
if (key == '4'){scene=4; } 
if (key == '5'){scene=5; } 
if (key == '6'){scene=6; }
if (key == '7'){scene=7; }
}


void mousePressed()
{
fill(random(250)); // Random fill color
noStroke(); // No outline
ellipse(mouseX, mouseY, 20, 20);
 
fill (random(100,250),random(250),random(100,255),random(80,100));
noStroke();
ellipse (mouseX+random(5,15),mouseY+random(10),random(60,100),random(80,100));
ellipse (mouseX+random(5),mouseY+random(25),random(50),random(50));
}
