//
//  Missle.swift
//  Copter Demo
//
//  Created by Kevin Byrom on 5/18/15.
//  Copyright (c) 2015 Kevin Byrom. All rights reserved.
//

import SpriteKit


class Missile : Entity
{
    let accel : CGFloat = 0.5
    let maxSpeed : CGFloat = 10.0
  
    var animation : SKAction?
    let sprite: SKSpriteNode
    
    var aim : CGPoint
    var velocity : CGPoint
    
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
    
    
    override init()
    {
     
        // Load the textures
        
        var textures:[SKTexture] = []
        
        textures.append(SKTexture(imageNamed: "Missile1"))
        textures.append(SKTexture(imageNamed: "Missile2"))
        
        
        // Load the animations
        
        animation = SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.1))
        
        
        // Create the sprite
        
        sprite = SKSpriteNode(imageNamed: "Missile1")
        
        aim = CGPoint.zero
        velocity = CGPoint.zero
        
        super.init()
    }
    
    
    override func spawn(_ spawnPosition: CGPoint)
    {
        addChild(sprite)
        
        removeAction(forKey: "animation")
        sprite.run(SKAction.repeatForever(animation!), withKey: "animation")
        
        super.spawn(spawnPosition)
    }
    
    
    override func despawn()
    {
        removeAllChildren()
        
        super.despawn()
    }
    
    
    func launchFrom(spawnPoint: CGPoint, towards target: CGPoint)
    {
        
        // Point towards the target and normalize
        
        let delta = CGPoint(x: target.x - spawnPoint.x, y: target.y - spawnPoint.y)
        
        aim = delta.normalize()
        
        
        // Reset velocity
        
        velocity = CGPoint.zero
        
        
        // Make it alive
        
        spawn(spawnPoint)
        
    }
    
    
    override func update(_ currentTime: CFTimeInterval)
    {
        if isAlive == true
        {
            // Update the velocity
        
            velocity.x += aim.x * accel
            velocity.y += aim.y * accel
        
        
            // Update the position
        
            position.x += velocity.x
            position.y += velocity.y
        
        
            // If colliding with an enemy ship, damage it and despawn
        
            // If out of screen bounds, despawn
        
            if position.x <= 0 || position.x >= 1024 || position.y <= 0 || position.y >= 768
            {
                despawn()
            }
        }
        
        super.update(currentTime)
        
    }
    
}
