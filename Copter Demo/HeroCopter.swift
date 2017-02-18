//
//  Copter.swift
//  Copter Demo
//
//  Created by Kevin Byrom on 5/15/15.
//  Copyright (c) 2015 Kevin Byrom. All rights reserved.
//

import SpriteKit

class HeroCopter : SKNode
{
    let gravity : CGFloat = 0.03
    let groundLevel : CGFloat = 192.0
    
    let sprite: SKSpriteNode
    var throttling : Bool!
    var slowThrottleAnimation : SKAction
    var fastThrottleAnimation : SKAction
    var damagedAnimation : SKAction
    var velocity : CGFloat
    var minVelocity : CGFloat
    var maxVelocity : CGFloat
    var accel : CGFloat
    var isDamaged : Bool = false
    var isAlive : Bool = true
    
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
    
    
    override init()
    {
        
        // Initialize the state
        
        throttling = true
        velocity = 0.0
        minVelocity = -3.0
        maxVelocity = 3.0
        accel = 0.0
        
        
        
        // Load the textures
        
        var textures:[SKTexture] = []
        
        textures.append(SKTexture(imageNamed: "Copter1"))
        textures.append(SKTexture(imageNamed: "Copter2"))
        
    
        var damagedTextures:[SKTexture] = []
        
        damagedTextures.append(SKTexture(imageNamed: "CopterDamaged1"))
        damagedTextures.append(SKTexture(imageNamed: "CopterDamaged2"))
        
        
        // Create the sprite
        
        sprite = SKSpriteNode(texture: textures[0])
    
        
        // Load the animations
        
        slowThrottleAnimation = SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.1))
        fastThrottleAnimation = SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.05))
        damagedAnimation = SKAction.repeatForever(SKAction.animate(with: damagedTextures, timePerFrame: 0.1))
        
        
        super.init()
    }
    
    
    func prepare()
    {
        self.position.x = parent!.frame.width / 4.0
        self.position.y = parent!.frame.height / 2.0
        sprite.zPosition = self.zPosition
        
        addChild(sprite)
        
        decreaseThrottle()
    }
    
    
    func update(currentTime: CFTimeInterval)
    {
        
        // Adjust the velocity based on the throttle
        
        if (throttling == true)
        {
            accel = 0.1
        }
        else
        {
            accel = 0
        }
        
        velocity += accel - gravity
        
        if (velocity < minVelocity)
        {
            velocity = minVelocity
        }
        
        if (velocity > maxVelocity)
        {
            velocity = maxVelocity
        }
        
        
        // Adjust the copter position based on velocity
        
        self.position.y += velocity - 0.1
        
    
        // Ensure position is within bounds
        
        if self.position.y <= groundLevel && isAlive == true
        {
            damage()
        }
        
        if (self.position.y < sprite.frame.height)
        {
            self.position.y = sprite.frame.height
            isAlive = false
        }
        
        
        // Update the sprite position
        
        //sprite.position.x = self.position.x
        //sprite.position.y = self.position.y
    }
    
    
    func damage()
    {
        if isDamaged == false
        {
            isDamaged = true
            throttling = false
            
            removeAction(forKey: "animation")
            sprite.run(SKAction.repeatForever(damagedAnimation), withKey: "animation")
        }
    }
    
    
    func increaseThrottle()
    {
        if isDamaged == false
        {
            if (throttling == false)
            {
                throttling = true
            
                removeAction(forKey: "animation")
                sprite.run(SKAction.repeatForever(fastThrottleAnimation), withKey: "animation")
            }
        }
    }
    
    
    func decreaseThrottle()
    {
        if isDamaged == false
        {
            if (throttling == true)
            {
                throttling = false
            
                removeAction(forKey: "animation")
                sprite.run(SKAction.repeatForever(slowThrottleAnimation), withKey: "animation")
            }
        }
    }
}
