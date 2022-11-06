import gifAnimation.*;

float xt = 0, yt = 0, x = 0, y = 0;
PImage fondo, fondo2, good, stars;
boolean flag = true, center = true, loose=false;
int you = rand_int_num(0,1000), rival, distance = rand_int_num(1,5), comidos=0;
String [] operations = new String [9];
int [] rivals = new int[9];
PFont font;
Gif malo, start, bueno;
Character You, R1, R2, R3, R4, R5, R6, R7, R8;
Character [] characters = new Character[9];
Gif lost;

void setup(){
  size(960,540);
  font = createFont("Arial",16,true);
  fondo = loadImage("inicio.png");
  lost = new Gif(this, "lost.gif");
  good = loadImage("Cartoon-alien.png");
  stars = loadImage("stars.jpg");
  start = new Gif(this, "pinicio.gif");
  malo = new Gif(this, "malo.gif");
  bueno = new Gif(this, "pbueno.gif");
  sumas();
  R5 = new Character(0,360,rivals[2],true,malo); // TODO -- OJO:: HACER MÁS GRANDE Y ACOMODAR
  
  R1 = new Character(0,0,rivals[1],true,malo); //////// Primera fila
  R2 = new Character(330,0,rivals[3],true,malo);
  R3 = new Character(650,0,rivals[4],true,malo);
  
  R4 = new Character(0,180,rivals[8],true,malo); //////// Segunda fila
  You = new Character(330,180,rivals[0],true,bueno);
  R6 = new Character(650,180,rivals[6],true,malo);
  
  
  R7 = new Character(330,360,rivals[5],true,malo); /////// Tercera fila
  R8 = new Character(650,360,rivals[7],true,malo);
  

  characters[0] = You;
  characters[1] = R1;
  characters[2] = R2;
  characters[3] = R3;
  characters[4] = R4;
  characters[5] = R5;
  characters[6] = R6;
  characters[7] = R7;
  characters[8] = R8;

}


void draw(){
  background(0);
  start.play(); // TODO -- OJO:: QUITAR FONDO
  malo.play();
  bueno.play();
  
  start1();
  if(flag==false)
  {
    grid(); 
  }

}


void start1(){
  if(flag == true)
  {
    image(fondo,0,0);
    image(start,250,200,width/2, height/2);
    if (mousePressed && (mouseButton == LEFT)) {
      fill(180);
      flag = false;
    } else {
      fill(126);
    }
    circle(420,230,100);
    fill(0);
    textSize(20);
    stroke(10);
    text("START", 395, 235); 
  }
}


void grid(){
  if(loose == true)
  {
    Loose(); return;
  }
  if(comidos==8)
  {
    Won();
    return;
  }
  stroke(255);
  strokeWeight(2);
  image(stars,0,0);
  
  xt = 320;
  while (xt < width) {
    line(xt,0,xt,height);
    xt = xt + 320;
  }
  
  yt = 180;
  while (yt < height) {
    line(0,yt,width,yt);
    yt = yt + 180;
  }
  
  // TODO -- OJO:: EL PERSONJE CENTRAL SE BORRA PQ SE QUEDA ATORADO EL MOUSE EN EL center

  for (int i = 0; i < 9; i++){
    if (characters[i].status==true){
      characters[i].display();
      hide(You, R1, R2, R3, R4, R5, R6, R7, R8);
      //characters[i].hide();
    }
  }
  
  if(center == true){
    characters[5].display();
  }
  
  fill(255);
  
  textFont(font,28);
  textAlign(CENTER);
  text(operations[1], 80, 170);
  text(operations[2], 80, 350);
  
  text(operations[5], 80, 530);
  
  text(operations[3], 400, 170);
  text(characters[0].value, 400, 350);
  text(operations[6], 400, 530);
  
  text(operations[4], 720, 170);
  text(operations[7], 720, 350);
  text(operations[8], 720, 530);
}

void sumas(){
    rival = you;
    operations[0] = str(you);
    rivals[0] = you;
    // println("YOU: "+ you);
    
    for(int i=1; i < 9; i++)
    {
        if(i%2==0)
        {
            operations[i] = cicle1(i);
        }
        else
        {
            operations[i] = cicle2(i);
        }
    }
    
    repeated();
    
    for(int i=1; i < 9; i++)
    {
        println(operations[i]);
        println(rivals[i]);
    }
}


void repeated(){
    for(int i=1; i < 9; i++)
    {
        for(int j=1; j < 9; j++)
        {
            if(operations[i] == operations[j] && i != j)
            {
                if(i%2==0)
                {
                    operations[i] = cicle1(i);
                }
                else
                {
                    operations[i] = cicle2(i);
                }
            }
        }
    }
}


int rand_int_num(int h, int l) {
    int num = int(random(h,l));
    return num;
}

String divide(int value, int i){
    int x=0;
    int y=0;
    while(x + y != value)
    {
        x = rand_int_num(0,1000);
        y = rand_int_num(0,1000);
    }
    rivals[i] = x+y;
    return str(x) + " + " + str(y);
}

String cicle1(int i){
    rival = rand_int_num(you/distance, you-distance);
    return divide(rival, i);
}

String cicle2(int i){
    rival = rand_int_num(you+5*distance, you*distance);
    return divide(rival, i);
}


int identify_mouse_on_grid(){  
//  println("X: " + mouseX + " Y: " + mouseY);
  if(mouseX > 0 && mouseX < 320 && mouseY > 0 && mouseY < 180){
 //   println("Top Left");
    return 1;
  } else if(mouseX > 320 && mouseX < 640 && mouseY > 0 && mouseY < 180){
  //  println("Top Center");
    return 2;
  } else if(mouseX > 640 && mouseX < 960 && mouseY > 0 && mouseY < 180){
  //  println("Top Right");
    return 3;
  } else if(mouseX > 0 && mouseX < 320 && mouseY > 180 && mouseY < 360){
   // println("Center Left");
    return 4;
  } else if(mouseX > 320 && mouseX < 640 && mouseY > 180 && mouseY < 360){
    //println("Center");
    return 5;
  } else if(mouseX > 640 && mouseX < 960 && mouseY > 180 && mouseY < 360){
    //println("Center Right");
    return 6;
  } else if(mouseX > 0 && mouseX < 320 && mouseY > 360 && mouseY < 540){
    //println("Bottom Left");
    return 7;
  } else if(mouseX > 320 && mouseX < 640 && mouseY > 360 && mouseY < 540){
    //println("Bottom Center");
    return 8;
  } else if(mouseX > 640 && mouseX < 960 && mouseY > 360 && mouseY < 540){
    //println("Bottom Right");
    return 9;
  }
  return 0;
}


int identify_mouse_grid_on_click(){
  if (mousePressed && (mouseButton == LEFT)) {
    return identify_mouse_on_grid();
  }
  return 0;
}


void hide(Character you, Character A1,Character A2,Character A3,Character A4,Character A5,Character A6,Character A7,Character A8) {
    int c = identify_mouse_grid_on_click();
    switch (c) {
    case 1: // top left (0,0)
      if(A1.value > you.value)
      {
        loose = true;
      }
      else
      {
        A1.status = false;
        int nValue = A1.value + you.value;
        A1.value = 0;
        //you.status = false;
        You = new Character(0,0,nValue,true,bueno);
        characters[0] = You;
        return;
      }
      break;
      case 2: // top center (330, 0)
      if(A2.value > you.value)
      {
        loose = true;
      }
      else
      {
        A2.status = false;
        int nValue = A2.value + you.value;
        A2.value = 0;
        //you.status = false;
        You = new Character(330,0,nValue,true,bueno);
        characters[0] = You;
        return;
      }
      break;
      case 3: //top right (650, 0)
      if(A3.value > you.value)
      {
        loose = true;
      }
      else
      {
        A3.status = false;
        int nValue = A3.value + you.value;
        A3.value = 0;
        //you.status = false;
        You = new Character(650,0,nValue,true,bueno);
        characters[0] = You;
        return;
      }
      break;
      case 4: //Center left
      if(A4.value > you.value)
      {
        loose = true;
      }
      else
      {
        A4.status = false;
        int nValue = A4.value + you.value;
        A4.value = 0;
        //you.status = false;
        You = new Character(0,180,nValue,true,bueno);
        characters[0] = You;
        return;
      }
      break;
      case 7: // Center
        if(A5.value > you.value)
      {
        loose = true;
      }
      else
      {
        A5.status = false;
        int nValue = A5.value + you.value;
        A5.value = 0;
        //you.status = false;
        You = new Character(0,360,nValue,true,bueno);
        characters[0] = You;
        center = false;
        return;
      }
      break;
      case 6: // Center right
      if(A6.value > you.value)
      {
        loose = true;
      }
      else
      {
        A6.status = false;
        int nValue = A6.value + you.value;
        A6.value = 0;
        //you.status = false;
        You = new Character(650,180,nValue,true,bueno);
        characters[0] = You;
        return;
      }
      break;
          case 8:
      if(A7.value > you.value)
      {
        loose = true;
      }
      else
      {
        A7.status = false;
        int nValue = A7.value + you.value;
        A7.value = 0;
        //you.status = false;
        You = new Character(330,360,nValue,true,bueno);
        characters[0] = You;
        return;
      }
      break;
          case 9:
      if(A8.value > you.value)
      {
        loose=true;
        
      }
      else
      {
        A8.status = false;
        int nValue = A8.value + you.value;
        A8.value = 0;
        //you.status = false;
        You = new Character(650,360,nValue,true,bueno);
        characters[0] = You;
        return;
      }
      break;
    }
  }





class Character {
  int x;
  int y;
  int value;
  boolean status;
  Gif image;
  

  Character(int x, int y, int value, boolean status, Gif image) {
    this.x = x;
    this.y = y;
    this.value = value;
    this.status = status;
    this.image = image;
  }


  void display() {
    image(this.image, this.x, this.y, width/3, height/3);
  }
}
void Loose()
{
  background(80);
  lost.play();
  image(lost,100,100,width, height);
}

void Won()
{
  background(0,255,0);
}
