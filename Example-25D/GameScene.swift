//
//  GameScene.swift
//  Example-25D
//
//  Created by mitchell hudson on 7/18/16.
//  Copyright (c) 2016 mitchell hudson. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var sprites = [Sprite3D]()
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        for i in 1...100 {
            let hue = CGFloat(arc4random() % 100) / 100
            let color = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
            let size = CGSize(width: 40, height: 40)
            let sprite3d = Sprite3D(texture: nil, color: color, size: size)
            addChild(sprite3d)
            
            
            // Sprites random spread
            sprite3d.x = CGFloat(arc4random() % 350) - 175
            sprite3d.y = CGFloat(arc4random() % 350) - 175
            sprite3d.z = CGFloat(arc4random() % 10000)
            
            /* 
            // Sprites in a line to the horizon
            sprite3d.x = 150
            sprite3d.y = -150
            sprite3d.z = CGFloat(i) * 50
            */
 
            sprite3d.render()
            sprites.append(sprite3d)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        for sprite in sprites {
            sprite.z -= 5
            if sprite.z < 0 {
                sprite.z = 10000
            }
            sprite.render()
        }
    }
}
