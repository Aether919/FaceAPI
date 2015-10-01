
public class MonsterFace extends FaceGroup
{
  public boolean rotate = false;
  public MonsterFace(String id) {
  super(id);
   
    PShape s = createShape(ELLIPSE,40,0,185,200);
    s.setFill(color(255, 249, 186));
    s.setStroke(color(255, 249, 186)); 
    shape.addChild(s);
    
    PShape nose = createShape(TRIANGLE, 40, -3, 60, 20, 35, 20);
    nose.setFill(color(237, 227, 135));
    nose.setStroke(color(0, 0, 0));
    shape.addChild(nose);
    
    PShape hair = createShape(ARC, 40, -40, 190, 130, 2.7, 6.7, PIE);
    hair.setFill(color(161, 91, 48));
    hair.setStroke((color(161, 91, 48)));
    shape.addChild(hair);
  }
}
public class MonsterEye extends AnimatedFeature
{
   public MonsterEye(String id, int x, int y) {
     super(id,x,y);
     open();
   }

   public PShape open() {
    shape = createShape(GROUP);
    
    PShape eye = createShape(ELLIPSE, x, y, 35, 25);
    eye.setFill(color(255));
    eye.setStroke(color(0));
    
    PShape iris = createShape(ELLIPSE, x, y, 20, 15);
    iris.setFill(color(32, 71, 26));
    iris.setStroke(color(0));
    
    shape.addChild(eye);
    shape.addChild(iris);
    return super.open();
  } 

  public PShape close() {
    shape = createShape(LINE,x-15,y+2,x+15,y+2);
    shape.setFill(color(0));
    shape.setStrokeWeight(4);
    shape.setStroke(color(0,0,0));
    return super.close();
  }  
}

public class MonsterEyeBrow extends AnimatedFeature
{
   public MonsterEyeBrow(String id, int x, int y) {
     super(id,x,y);
     close();
   }

   public PShape close() {
    shape = createShape(RECT,x,y,50,10);
    shape.setFill(color(105, 50, 14));
    shape.setStroke(color(107, 13, 13));
    return super.close();
  } 

  public PShape open() {
    shape = createShape(RECT,x,y-20,50,10);
    shape.setFill(color(105, 50, 14));
    shape.setStroke(color(107,13,13));
    return super.open();
  }  
}

public class MonsterMouth extends AnimatedFeature
{  
   public MonsterMouth(String id, int x, int y) {
     super(id,x,y);
     open();
   }
  
   public PShape open() {
    shape = createShape(ELLIPSE, x, y, 50, 20);
    shape.setFill(color(0));
    shape.setStroke(color(0));
    return super.open();
  } 

  public PShape close() {
    shape = createShape(LINE,x-25,y,x+25,y);
    shape.setFill(color(0));
    shape.setStrokeWeight(4);
    shape.setStroke(color(0,0,0));
    return super.close();
  } 
}

public class AvatarFace
{
    MonsterEye ojoIzq;
    MonsterEye ojoDer;
    MonsterEyeBrow eyebrIzq;
    MonsterEyeBrow eyebrDer;
    MonsterMouth boca;
    MonsterFace cara;
    
  
  public AvatarFace()
  {
    ojoIzq = new MonsterEye("ojoIzq",   0, -20);
    ojoDer = new MonsterEye("ojoDer", 85, -20);
    eyebrIzq = new MonsterEyeBrow("ejebrIzq", -30, -35);
    eyebrDer = new MonsterEyeBrow("ejebrDer", 65, -35);
      boca = new MonsterMouth("boca",  45, 50);
      cara = new MonsterFace("puppet");  
    
    cara.add(ojoIzq);
    cara.add(ojoDer);
    cara.add(eyebrIzq);
    cara.add(eyebrDer);
    cara.add(boca);
    
  }

  public void draw(int x, int y) {
    cara.position(x,y);
    cara.draw();
  }

  public BasicState status(FeatureID id) {
    if (id == FeatureID.LeftEye) {
        return ojoIzq.status();
    } else if (id == FeatureID.RightEye) {
        return ojoDer.status();      
    }
    return BasicState.Undefined;
  }
   
  public void change(FeatureID id, Action action)
  {
    // PS BUG no-enum-switch 
    if (id == FeatureID.LeftEye) { // ojo izq?
      if (action == Action.closeEye) {
          cara.replaceShape(ojoIzq.getID(),ojoIzq.close());
      } else {
          cara.replaceShape(ojoIzq.getID(),ojoIzq.open());
      }
    } else if (id == FeatureID.RightEye) { // ojo der?
      if (action == Action.closeEye) {
          cara.replaceShape(ojoDer.getID(),ojoDer.close());
      } else {
          cara.replaceShape(ojoDer.getID(),ojoDer.open());
      } // if close
    } else if (id == FeatureID.Mouth) { // boca?
      if (action == Action.closeMouth) {
          cara.replaceShape(boca.getID(),boca.close());
      } else {
          cara.replaceShape(boca.getID(),boca.open());
      } // if close
    }
    else if (id == FeatureID.LeftBrow) { // ojo izq?
      if (action == Action.archBrow) {
          cara.replaceShape(eyebrIzq.getID(),eyebrIzq.open());
      } else {
          cara.replaceShape(eyebrIzq.getID(),eyebrIzq.close());
      }
    }
    else if (id == FeatureID.RightBrow) { 
      if (action == Action.archBrow) {
          cara.replaceShape(eyebrDer.getID(),eyebrDer.open());
      } else {
          cara.replaceShape(eyebrDer.getID(),eyebrDer.close());
      }
    }
    else if (id == FeatureID.Face) { 
      if (action == Action.Rotate) {
          cara.rotate = true;
      } else {
          cara.rotate = false;
      }
    }
  }
}
