//
//  Ground.swift
//  Copter Demo
//
//  Created by Kevin Byrom on 5/15/15.
//  Copyright (c) 2015 Kevin Byrom. All rights reserved.
//

import SpriteKit

class Ground : SKNode
{
    let groundVelocity : CGFloat = 5
    
    let sprite: SKSpriteNode

    
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
    
    
    override init()
    {
        
        // Create the sprite
        
        sprite = SKSpriteNode(imageNamed: "Ground")
        
        
        super.init()
    }
    
    
    func prepare()
    {
        self.position = CGPoint.zero
        
        sprite.anchorPoint = CGPoint.zero
        sprite.position = CGPoint.zero
        sprite.zPosition = self.zPosition
        
        addChild(sprite)
    }
    
    
    func update(_ currentTime: CFTimeInterval)
    {
     
        position.x -= groundVelocity
        
        if position.x <= -405
        {
           position.x = 0
        }
    }
}
