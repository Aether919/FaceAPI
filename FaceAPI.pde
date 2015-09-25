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
  monster.draw(mouseX,mouseY);
}

void mousePressed()
{
  clicks = (clicks + 1)  % 11; // 0...6
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
    case 0: // rotate
     //  monster.rotate(0.1); 
  }
}
