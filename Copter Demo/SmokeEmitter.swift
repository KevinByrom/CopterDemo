//
//  SmokeEmitter.swift
//  Copter Demo
//
//  Created by Kevin Byrom on 5/17/15.
//  Copyright (c) 2015 Kevin Byrom. All rights reserved.
//

import SpriteKit


class SmokeEmitter : SKEmitterNode
{
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
    
    
    override init()
    {
        super.init()
    }
    
    
    func prepare()
    {
        particleTexture = SKTexture(imageNamed: "Smoke1")
        particleBirthRate = 5
        particleLifetime = 1
        particleSpeed = 1
        particleScale = 1.0
        particleColorBlendFactor = 0
        particlePosition = CGPoint.zero
        emissionAngle = 90
    }
    
}
