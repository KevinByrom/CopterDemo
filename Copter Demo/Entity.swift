//
//  Entity.swift
//  Copter Demo
//
//  Created by Kevin Byrom on 5/17/15.
//  Copyright (c) 2015 Kevin Byrom. All rights reserved.
//

import SpriteKit


class Entity : SKNode
{
    var state : EntityState
    var isAlive : Bool = false
    
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
    
    
    override init()
    {
        state = EntityState()
        super.init()
    }
    
    
    func spawn(_ spawnPosition : CGPoint)
    {
        position = spawnPosition
        isAlive = true
    }
    
    
    func despawn()
    {
        isAlive = false
    }
    

    func damage()
    {
        
    }
    
    
    func update(_ currentTime: CFTimeInterval)
    {
        state.update(currentTime)
    }
    
    
    func changeState(_ newState : EntityState) -> Bool
    {
        var changed : Bool = false
        
        if isInState(newState) == false
        {
            if (state.onExiting() == true)
            {
                let oldState = state
                
                state = newState
            
                oldState.onExited()
                state.onEntered()
                
                changed = true
            }
        }
        
        return changed
    }
    
    
    func isInState(_ state: EntityState) -> Bool
    {
        return self.state.id == state.id
    }
}
