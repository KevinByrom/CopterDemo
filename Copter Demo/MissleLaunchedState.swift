//
//  MissileNormalState.swift
//  Copter Demo
//
//  Created by Kevin Byrom on 5/18/15.
//  Copyright (c) 2015 Kevin Byrom. All rights reserved.
//
/*

import SpriteKit


class MissileLaunchedState : MissleState
{
    var animation : SKAction?
    var target : CGPoint?
    
    
    override init()
    {
        super.init()
        
        
        // Set state id
        
        id = 1
        
        
        // Load the textures
        
        var textures:[SKTexture] = []
        
        textures.append(SKTexture(imageNamed: "Missile1"))
        textures.append(SKTexture(imageNamed: "Missile2"))
        
        
        // Load the animations
        
        animation = SKAction.repeatActionForever(SKAction.animateWithTextures(textures, timePerFrame: 0.1))
    }
    
    
    override func onEntered()
    {
        super.onEntered()
        
        
        // Set the sprite animation
        
        missile!.sprite.runAction(SKAction.repeatActionForever(animation!), withKey: "animation")
        
        
        // Disable the smoke emitter
        
    }
    
    
    override func update(currentTime: CFTimeInterval)
    {
        // Move the missle toward the target
        // If missile is colliding with an enemy, damage the enemy and despawn the missle
    }
}*/