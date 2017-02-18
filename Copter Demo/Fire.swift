//
//  Fire.swift
//  Copter Demo
//
//  Created by Kevin Byrom on 5/17/15.
//  Copyright (c) 2015 Kevin Byrom. All rights reserved.
//

import SpriteKit

class Fire : SKNode
{
    var sprite : SKSpriteNode
    var textures : [SKTexture] = []
    var animation : SKAction
    
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
    
    
    override init()
    {
        
        // Load the textures
        
        textures.append(SKTexture(imageNamed: "Explosion1"))
        textures.append(SKTexture(imageNamed: "Explosion2"))
        
        
        // Load the animation
        
        animation = SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.1))
        
        
        // Create the sprite
        
        sprite = SKSpriteNode(texture: textures[0])
        
        super.init()
    }

    
    func prepare()
    {
       
        
        // Run the animation and add the sprite
        
        sprite.run(animation)
        sprite.zPosition = self.zPosition
        
        addChild(sprite)
        
        
        // Create a smoke emitter
    }
}
