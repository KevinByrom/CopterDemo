//
//  EntityState.swift
//  Copter Demo
//
//  Created by Kevin Byrom on 5/17/15.
//  Copyright (c) 2015 Kevin Byrom. All rights reserved.
//


import SpriteKit


class EntityState
{
    var id : Int
 
    
    init()
    {
        id = -1
    }
    
    
    func onEntered()
    {
        
    }
    
    
    func onExiting() -> Bool
    {
        return true
    }
    
    
    func onExited()
    {
        
    }
    
    
    func update(_ currentTime: CFTimeInterval)
    {
    }
}
