//
//  Copter.swift
//  Copter Demo
//
//  Created by Kevin Byrom on 5/15/15.
//  Copyright (c) 2015 Kevin Byrom. All rights reserved.
//

import SpriteKit


class EnemyCopter : Entity
{
    let gravity : CGFloat = 3
    let copterSpeed : CGFloat = 7.0
    let normalState = EnemyCopterNormalState()
    let damagedState = EnemyCopterDamagedState()
    
    let sprite: SKSpriteNode

    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
    
    
    override init()
    {
        
        // Create the sprite
        
        sprite = SKSpriteNode(imageNamed: "EnemyCopter1")

        
        super.init()
    }
    
    
    func prepare()
    {
        normalState.copter = self
        damagedState.copter = self
      
        sprite.zPosition = self.zPosition
        
        addChild(sprite)
    }
    
    
    override func spawn(_ spawnPosition: CGPoint)
    {
        changeState(normalState)
        super.spawn(spawnPosition)
    }
    
    
    override func update(_ currentTime: CFTimeInterval)
    {
  
        super.update(currentTime)
        
        // If the copter is off the screen, kill it
        
        if (self.position.x <= -192 || self.position.y <= -64)
        {
            isAlive = false
        }
    }
 
    
    override func damage()
    {
        changeState(damagedState)
    }
    
}
