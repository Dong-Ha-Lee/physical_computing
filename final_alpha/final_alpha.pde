import processing.sound.*;
import processing.serial.*;
SoundFile c;
SoundFile d;
SoundFile e;
SoundFile f;
SoundFile g;
SoundFile a;
SoundFile b;
 

Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
int tab; 
boolean punch = false;
int punch_count;
int prev_tab;
void setup()
{
  // I know that the first port in the serial list on my mac
  // is Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = "COM4"; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  
  c = new SoundFile(this, "A.mp3");
  d = new SoundFile(this, "S.mp3");
  e = new SoundFile(this, "D.mp3");
  f = new SoundFile(this, "F.mp3");
  g = new SoundFile(this, "G.mp3");
  a = new SoundFile(this, "H.mp3");
  b = new SoundFile(this, "J.mp3");

  punch_count = 0;
}

void draw()
{
  if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('.');   
  val = parseData(val);// read it and store it in val
  } 
  if (val!=null){
  tab = getTab(val);
  }
  println(tab);
  if(tab>0)
  playSound(tab);
}
void playSound(int tab){
   switch(tab){
  case 1:
    c.play();
    break;
  case 2:
    d.play();
    break;
  case 3:
    e.play();
    break;
  case 4:
    f.play();
    break;
  case 5:
    g.play();
    break;
  case 6:
    a.play();
    break;
  case 7:
    b.play();
    break;
  }
}
Integer getTab(String data){
   prev_tab = tab;
  tab = parseInt(data);
  tab = parseInt(tab/10);
  
  if (tab >7){
  tab = 0;
  }  
  if(tab>0 && prev_tab==0){
    punch = true;
    return tab;
  }
  else{
    punch = false;
    return 0;
  }

}

public String parseData(String str) {
    if (str != null && str.length() > 0 && str.charAt(str.length() - 1) == '.') {
        str = str.substring(0, str.length() - 1);
    }
    return str;
}
