//
//  EnemyCopterNormalState.swift
//  Copter Demo
//
//  Created by Kevin Byrom on 5/17/15.
//  Copyright (c) 2015 Kevin Byrom. All rights reserved.
//


import SpriteKit


class EnemyCopterNormalState : EnemyCopterState
{
    var animation : SKAction!
    
    
    override init()
    {
        super.init()
        
        
        // Set state id
        
        id = 1
        
        
        // Load the textures
        
        var textures:[SKTexture] = []
        
        textures.append(SKTexture(imageNamed: "EnemyCopter1"))
        textures.append(SKTexture(imageNamed: "EnemyCopter2"))
        
        
        // Load the animations
        
        animation = SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.1))
    }
    
    
    override func onEntered()
    {
        super.onEntered()

        
        // Set the sprite animation
        
        copter.sprite.run(SKAction.repeatForever(animation), withKey: "animation")
        
        
        // Disable the smoke emitter
        
    }
    
    
    override func update(_ currentTime: CFTimeInterval)
    {
        copter.position.x -= copter.copterSpeed
    }
}
