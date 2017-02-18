//
//  EnemySpawner.swift
//  Copter Demo
//
//  Created by Kevin Byrom on 5/17/15.
//  Copyright (c) 2015 Kevin Byrom. All rights reserved.
//

import SpriteKit


class EnemySpawner : SKNode
{
    var entities : [Entity] = []
    var spawnRect : CGRect = CGRect.zero
    
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }


    override init()
    {
        super.init()
    }
    
    
    func update(_ currentTime: CFTimeInterval)
    {
        
        // Check for any dead entities and respawn
        
        for entity in entities
        {
            if entity.isAlive == false
            {
                spawn(entity)
            }
        }
    }
    
    
    func spawn(_ entity : Entity)
    {
        
        // Choose a random position for the entity
    
        let xPos = position.x + CGFloat(arc4random_uniform(UInt32(spawnRect.width)))
        let yPos = position.y + CGFloat(arc4random_uniform(UInt32(spawnRect.height)))
   
        
        let spawnPoint = CGPoint(x: xPos, y: yPos)
        
        entity.spawn(spawnPoint)
        
    }
}
