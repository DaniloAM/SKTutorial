
//
//  MyScene.swift
//  SpriteKitTest
//
//  Created by Danilo Mative on 18/06/15.
//  Copyright (c) 2015 AM. All rights reserved.
//

import SpriteKit
import UIKit

class MyScene: SKScene {
   
    let duration = 2.0
    let jumpDuration = 0.3
    var character:SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        
        let sparkEmmitterPath:NSString = NSBundle.mainBundle().pathForResource("MyParticle", ofType: "sks")!
        
        let sparkEmmiter = NSKeyedUnarchiver.unarchiveObjectWithFile(sparkEmmitterPath as String) as! SKEmitterNode
        
        sparkEmmiter.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame))
        sparkEmmiter.position.y += 50;
        
        self.addChild(sparkEmmiter)
        
        
        let swipe = UISwipeGestureRecognizer(target: self, action: Selector("jumpAction"));
        swipe.direction = UISwipeGestureRecognizerDirection.Up;
        self.view?.addGestureRecognizer(swipe);
        
        character = self.childNodeWithName("character") as! SKSpriteNode
        
        var background1 = self.childNodeWithName("background1") as! SKSpriteNode
        var background2 = self.childNodeWithName("background2") as! SKSpriteNode
        
        let originAction = SKAction.moveToX(background1.size.width / 2, duration: 0)
        let moveAction = SKAction.moveByX(-background1.size.width, y: 0, duration: duration)
        let hiddenAction = SKAction.moveToX(background1.size.width / 2 + background1.size.width, duration: 0)
        
        let backgroundAction1 = SKAction.repeatActionForever(SKAction.sequence([originAction,moveAction,hiddenAction,moveAction]))
        
        let backgroundAction2 = SKAction.repeatActionForever(SKAction.sequence([hiddenAction,moveAction,moveAction,hiddenAction]))
        
        background1.runAction(backgroundAction1)
        background2.runAction(backgroundAction2)
        
    }
    
    func jumpAction() {
        
        if !character.hasActions() {
            
            let upAction = SKAction.moveByX(0, y: self.size.height / 3, duration: jumpDuration)
            let downAction = SKAction.moveByX(0, y: -self.size.height / 3, duration: jumpDuration)
            let halfRotation = SKAction.rotateByAngle(CGFloat(-M_PI), duration: jumpDuration)
            
            let testColor = SKAction.colorizeWithColor(UIColor.blueColor(), colorBlendFactor: 1, duration: jumpDuration);
            let reverseColor = testColor.reversedAction()
            
            let jumpUpAction = SKAction.group([upAction,halfRotation,testColor])
            let jumpDownAction = SKAction.group([downAction,halfRotation, reverseColor])
            
            character.runAction(SKAction.sequence([jumpUpAction, jumpDownAction]))
        }
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        
        
    }
    
    
}
