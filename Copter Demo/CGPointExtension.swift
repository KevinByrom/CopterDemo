//
//  CGPointExtension.swift
//  Copter Demo
//
//  Created by Kevin Byrom on 5/19/15.
//  Copyright (c) 2015 Kevin Byrom. All rights reserved.
//



import Foundation
import SpriteKit


extension CGPoint
{
    func length() -> CGFloat
    {
        return sqrt((self.x * self.x) + (self.y * self.y))
    }
    
    
    func normalize() -> CGPoint
    {
        var normalized : CGPoint = CGPoint.zero
        
        let magnitude : CGFloat = length()
        
        if magnitude != 0
        {
            normalized.x = self.x / magnitude
            normalized.y = self.y / magnitude
        }
        else
        {
            normalized.x = self.x
            normalized.y = self.y
        }
        
        return normalized
    }
    
    
    func toDegrees() -> CGFloat
    {
        //var bearingRadians = atanf(y, x)
        //var bearingDegrees = bearingRadians * (180.0 / M_PI)
        
        //return bearingDegrees
        
        return 0.0
    }
}
