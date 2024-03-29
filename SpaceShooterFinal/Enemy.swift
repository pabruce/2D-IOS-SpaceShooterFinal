//
//  Enemy.swift
//  Space Shooter
//
//  Created by pbruce on 2/26/18.
//  Copyright © 2018 pbruce. All rights reserved.
//

import Foundation
import SpriteKit

class Enemy : NSObject {
   
    var canFireLaser = false
    var enemySprite:SKSpriteNode?
    var timer = Timer()
    
    class func SpriteName() -> String {
        return "enemy"
    }
    
    var finalPos: CGPoint = CGPoint(x: 0, y: 0)
    
    init(imageName:String,canFire:Bool) {
        super.init()
        
        canFireLaser = canFire
        
        let spTexture = SKTexture(imageNamed: imageName)
        enemySprite = SKSpriteNode(texture: spTexture)
        enemySprite?.name = Enemy.SpriteName()
        
        enemySprite?.physicsBody = SKPhysicsBody(texture: spTexture, size: enemySprite!.size)
        enemySprite?.physicsBody?.isDynamic = false
        enemySprite?.physicsBody?.categoryBitMask = enemyBitMask
        enemySprite?.physicsBody?.collisionBitMask = laserShotBitMask
        enemySprite?.physicsBody?.contactTestBitMask = laserShotBitMask
        
        enemySprite?.physicsBody?.isDynamic = true
        enemySprite?.physicsBody?.allowsRotation = false

        if (canFire) {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(Enemy.fireGun), userInfo: nil, repeats: true)
        }
    }
    
    @objc func fireGun() {
        if (enemySprite != nil && enemySprite!.parent != nil) {
            if (enemySprite?.name == Enemy.SpriteName()) {
                // only fire if sprite is still an enemy, i.e. not when explodiing
                let shot = EnemyShot(parentNode: enemySprite!.parent!, pos:CGPoint(x: enemySprite!.position.x,y: enemySprite!.position.y-enemySprite!.size.height))
                    shot.Shoot(finalPos)
            }
        }
    }
}
