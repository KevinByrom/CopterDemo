//
//  EnemyCopterDamagedState.swift
//  Copter Demo
//
//  Created by Kevin Byrom on 5/17/15.
//  Copyright (c) 2015 Kevin Byrom. All rights reserved.
//


import Foundation


import SpriteKit


class EnemyCopterDamagedState : EnemyCopterState
{
    var animation : SKAction!
    
    
    override init()
    {
        super.init()
        
        
        // Set state id
        
        id = 2
        
        
        // Load the textures
        
        var textures:[SKTexture] = []
        
        textures.append(SKTexture(imageNamed: "EnemyCopterDamaged1"))
        textures.append(SKTexture(imageNamed: "EnemyCopterDamaged2"))
        
        
        // Load the animations
        
        animation = SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.1))
    }
    
    override func onEntered()
    {
        super.onEntered()
        
        
        // Set sprite animation
        
        copter.sprite.run(SKAction.repeatForever(animation), withKey: "animation")
        
        
        // Enable the smoke emitter
        
    }
    
    
    override func update(_ currentTime: CFTimeInterval)
    {
        // Move the copter downwards and over
        
        copter.position.x -= copter.copterSpeed
        copter.position.y -= copter.gravity
    }
}
