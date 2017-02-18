//
//  Building.swift
//  Copter Demo
//
//  Created by Kevin Byrom on 5/15/15.
//  Copyright (c) 2015 Kevin Byrom. All rights reserved.
//

import SpriteKit


class Building : SKNode
{
    let groundLevel : CGFloat = 192.0
    let buildingVelocity : CGFloat = 5
    
    var buildingTexture : SKTexture
    var buildingTopTexture : SKTexture
    var bounds : CGSize
    
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
    
    
    override init()
    {
        
        // Load the textures
        
        buildingTopTexture = SKTexture(imageNamed: "BuildingTop")
        buildingTexture = SKTexture(imageNamed: "Building")
        
        bounds = CGSize.zero
        
        super.init()
    }
    
    
    func construct()
    {
        
        // Determine a random building height
        
        let heightUnits = Int(arc4random_uniform(3) + 1)
        
        
        // Determine new building position
        
        let distanceUnits = Int(arc4random_uniform(500))
        
        position = CGPoint(x: parent!.frame.width + CGFloat(distanceUnits), y: groundLevel)
        
        bounds = CGSize(width: buildingTexture.size().width, height: buildingTexture.size().height * CGFloat(heightUnits))

            
        // Remove existing sprites
        
        removeAllChildren()
       
        
        // Build new sprites and position them
        
        for index in 0 ..< heightUnits
        {
            let buildingSprite = SKSpriteNode(texture: buildingTexture)
            
            buildingSprite.anchorPoint = CGPoint.zero
            buildingSprite.position.x = 0
            buildingSprite.position.y = buildingTexture.size().height * CGFloat(index)
            buildingSprite.zPosition = self.zPosition
            
            addChild(buildingSprite)
        }
        
        let buildingTopSprite = SKSpriteNode(texture: buildingTopTexture)
        
        buildingTopSprite.anchorPoint = CGPoint.zero
        buildingTopSprite.position = CGPoint(x: 0.0, y: buildingTexture.size().height * CGFloat(heightUnits))
        buildingTopSprite.zPosition = self.zPosition
        
        addChild(buildingTopSprite)
        
    }
    
    
    func update(_ currentTime: CFTimeInterval)
    {
        
        position.x -= buildingVelocity
        
        
        // If building is off screen, reconstruct in a new position
        
        if position.x <= -bounds.width
        {
            construct()
            
            //if let mainScene = self.parent as? GameScene
           // {
            //    mainScene.incrementScore()
            //}
        }
    }
}
