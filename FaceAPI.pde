// Monster class ver. 0.3

AvatarFace monster;
int clicks = 0;

void setup() {
   size(400,400,P2D);
   monster = new AvatarFace();
   noCursor();
}

void draw() {
  background(200);
  if(monster.cara.rotate == true){
  translate(mouseX, mouseY);   // Move coordinate system to center of sketch
  rotate(millis() * 0.001 * TWO_PI / 10.0);   // Move 360 degrees in ten second
  monster.draw(0, 0);
  }
  else{
    monster.draw(mouseX, mouseY);
  }
}

void mousePressed()
{
  clicks = (clicks + 1)  % 13; // 0...6
  switch (clicks) {
    case 1: // close left eye
      monster.change(FeatureID.LeftEye,Action.closeEye);
      break;
    case 2: // close right eye
      monster.change(FeatureID.RightEye,Action.closeEye);
      break;
    case 3: // close mouth
      monster.change(FeatureID.Mouth,Action.closeMouth);
      break;
    case 4: // arch left brow
      monster.change(FeatureID.LeftBrow,Action.archBrow);
      break;
    case 5: // arch right brow
      monster.change(FeatureID.RightBrow,Action.archBrow);
      break;
    case 6: // open left eye
      monster.change(FeatureID.LeftEye,Action.openEye);
      break;
    case 7: // open right eye
      monster.change(FeatureID.RightEye,Action.openEye);
      break;
    case 8: // open mouth
      monster.change(FeatureID.Mouth,Action.openMouth);
      break;
    case 9: // frow left brow
      monster.change(FeatureID.LeftBrow,Action.frownBrow);
      break;
    case 10: // frow right brow
      monster.change(FeatureID.RightBrow,Action.frownBrow);
      break;
    case 11: // Rotate Face
      monster.change(FeatureID.Face,Action.Rotate);
      break;
    case 12: // Stop Rotation
      monster.change(FeatureID.Face,Action.Stop);
      break;
    case 0:
  }
}
