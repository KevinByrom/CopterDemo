//
//  EnemyCopterNormalState.swift
//  Copter Demo
//
//  Created by Kevin Byrom on 5/18/15.
//  Copyright (c) 2015 Kevin Byrom. All rights reserved.
//


import SpriteKit


class CameraTrackingState : CameraState
{
    var trackEntity : Entity!
    var trackOffset : CGPoint!
    
    
    override init()
    {
     
        super.init()
        
        
        // Set state id
        
        id = 1

    }
    
    
    override func onEntered()
    {
        super.onEntered()
    }
    
    
    override func update(_ currentTime: CFTimeInterval)
    {
        camera.position = CGPoint(x: trackEntity.position.x + trackOffset.x, y: trackEntity.position.y + trackOffset.y)
    }
}
