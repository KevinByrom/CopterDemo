//
//  GameScene.swift
//  Copter Demo
//
//  Created by Kevin Byrom on 5/15/15.
//  Copyright (c) 2015 Kevin Byrom. All rights reserved.
//

import SpriteKit

class GameScene: SKScene
{
    let maxBuildings = 4
    let maxEnemies = 2
    
    var heroCopter : HeroCopter!
    var missile : Missile!
    var enemies : [Entity] = []
    var enemySpawner : EnemySpawner!
    var buildings : [Building] = []
    var background : SKSpriteNode!
    var ground : Ground!
    var scoreLabel : SKLabelNode!
    var score : Int = 0
    var gameOver : Bool = false
    
    
    override func didMove(to view: SKView)
    {
        setupGame()
    }
    
    
    func setupGame()
    {
        score = 0
        gameOver = false
        
        // Setup the scene
        
        removeAllChildren()
        
        setupBackground()
        setupGround()
        setupBuildings()
        setupHero()
        setupEnemies()
        setupHUD()
    }
    
    
    func setupBackground()
    {
        background = SKSpriteNode(imageNamed: "Background")
        background.anchorPoint = CGPoint.zero
        background.position = CGPoint.zero
        background.name = "background"
        background.zPosition = 0
        
        addChild(background)
        
        let bgMove = SKAction.move(to: CGPoint(x:self.frame.width - background.frame.width, y:0), duration: 60.0);
        background.run(bgMove)
    }
    
    
    func setupGround()
    {
        ground = Ground()
        ground.zPosition = 1
        
        addChild(ground)
        
        ground.prepare()
    }
    
    
    func setupBuildings()
    {
        buildings = []
        
        for _ in 1...maxBuildings
        {
            let building = Building()
            
            addChild(building)
            
            building.construct()
            building.zPosition = 2
            
            buildings.append(building)
        }
    }
    
    
    func setupHero()
    {
        heroCopter = HeroCopter()
        heroCopter.zPosition = 3
        
        addChild(heroCopter)
        
        heroCopter.prepare()
        
        missile = Missile()
        missile.zPosition = 4
        
        addChild(missile)
    }
    
    
    func setupEnemies()
    {
        enemies = []
        
        for _ in 1...maxEnemies
        {
            let enemy = EnemyCopter()
            
            addChild(enemy)
            
            enemy.prepare()
            
            enemy.isAlive = false
            enemy.zPosition = 4
            
            enemies.append(enemy)
        }
        
        enemySpawner = EnemySpawner()
        enemySpawner.position = CGPoint(x: frame.width, y: 300)
        enemySpawner.spawnRect = CGRect(x:0, y:0, width: 2500, height: 400)
        enemySpawner.entities = enemies
        
        addChild(enemySpawner)
    }
    
    
    func setupHUD()
    {
        // Setup the score label
        
        scoreLabel = SKLabelNode(fontNamed:"Chalkduster")
        
        scoreLabel.text = "0";
        scoreLabel.fontSize = 65;
        scoreLabel.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        
        self.addChild(scoreLabel)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        /* Called when a touch begins */
        
        for touch in (touches )
        {
            let location = touch.location(in: self)
            
            if gameOver == false
            {
                if location.x < 256
                {
                    heroCopter.increaseThrottle()
                }
                else
                {
                    if missile.isAlive == false
                    {
                        missile.launchFrom(spawnPoint: heroCopter.position, towards: location)
                    }
                }
            }
            else
            {
                setupGame()
            }
        }
    }
   
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        heroCopter.decreaseThrottle()
    }
    
    
    override func update(_ currentTime: CFTimeInterval)
    {
        
        // Update hero
        
        heroCopter.update(currentTime: currentTime)
        
        missile.update(currentTime)
        
        let copterRect = CGRect(x: heroCopter.position.x, y: heroCopter.position.y, width: 112, height: 32)
        
        
        // Update enemies
        
        for enemy in enemies
        {
            enemy.update(currentTime)
            
            let enemyRect = CGRect(x: enemy.position.x, y: enemy.position.y, width: 112, height: 32)
            
            
            // Check for collision with copter
            
            if enemyRect.intersects(copterRect)
            {
                heroCopter.damage()
            }
            
            
            // Check for collision with missile
            
            if missile.isAlive
            {
                
            
                if enemyRect.contains(missile.position)
                {
                    enemy.damage()
                    missile.despawn()
                    incrementScore()
                }
            }
        }
        
        enemySpawner.update(currentTime)
        
        
        // Update Buildings
        
        for building in buildings
        {
            building.update(currentTime)
        }
        
        ground.update(currentTime)
        
        
        // Check for game over status
        
        if heroCopter.isAlive == false && gameOver == false
        {
            let gameOverLabel1 = SKLabelNode(fontNamed:"Chalkduster")
            
            gameOverLabel1.text = "Game Over";
            gameOverLabel1.fontSize = 65;
            gameOverLabel1.position = CGPoint(x:self.frame.midX, y: 600.0);
            
            self.addChild(gameOverLabel1)
            
            
            let gameOverLabel2 = SKLabelNode(fontNamed:"Chalkduster")
            
            gameOverLabel2.text = "Tap to Reset";
            gameOverLabel2.fontSize = 65;
            gameOverLabel2.position = CGPoint(x:self.frame.midX, y: 256.0);
            
            self.addChild(gameOverLabel2)
            
            
            gameOver = true
        }
    }
    
    func incrementScore()
    {
        score = score + 1;
        
        scoreLabel.text = "\(score)"
    }
}
