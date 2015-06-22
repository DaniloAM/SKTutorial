//
//  GameScene.swift
//  SpriteKitTest
//
//  Created by Danilo Mative on 17/06/15.
//  Copyright (c) 2015 AM. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var startButton:SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        
//        self.backgroundColor = UIColor.whiteColor()
//        
//        let myLabel = SKLabelNode(fontNamed:"Avenir-Black")
//        myLabel.text = "My New Awesome Game!"
//        myLabel.fontColor = UIColor.redColor()
//        myLabel.fontSize = 32
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMaxY(self.frame) - 80);
//        
//        startButton = SKSpriteNode();
//        startButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMaxY(self.frame) - 320);
//        startButton.size = CGSizeMake(self.size.width * 0.35, 80)
//        startButton.color = UIColor.blueColor()
//        startButton.name = "startButton"
//        
//        let startLabel = SKLabelNode(fontNamed: "Avenir-Black")
//        startLabel.text = "Start Game"
//        startLabel.fontColor = UIColor.whiteColor()
//        startLabel.fontSize = 45
//        startLabel.position = CGPoint(x: startButton.position.x, y: startButton.position.y - 10)
//        
//        self.addChild(startButton)
//        self.addChild(startLabel)
//        self.addChild(myLabel)
        
        
        startButton = self.childNodeWithName("startButton") as! SKSpriteNode;
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            
            let location = touch.locationInNode(self)
            if startButton.containsPoint(location) {
                
//                if let scene = MyScene.unarchiveFromFile("MyScene") as? MyScene {
//                    
//                    scene.scaleMode = .AspectFill
//                    
//                    self.view?.presentScene(scene)
//                    
//                    
//                }
                
                let mainScene = MyScene(fileNamed: "MyScene")
                
                mainScene.scaleMode = .AspectFill
                self.view?.presentScene(mainScene)
                
                println("Start!")
            }
         }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
