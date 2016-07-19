//
//  GameScene.swift
//  Example-25D
//
//  Created by mitchell hudson on 7/18/16.
//  Copyright (c) 2016 mitchell hudson. All rights reserved.
//

import SpriteKit

class GameScene2: SKScene {
    
    var sprites = [Sprite3D]()
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        for i in 0 ..< 10 {
            let hue = CGFloat(arc4random() % 100) / 100
            let color = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
            let size = CGSize(width: 40, height: 40)
            let sprite3d = Sprite3D(texture: nil, color: color, size: size)
            addChild(sprite3d)
            
            
            // Sprites in a circle
            let inc = CGFloat(M_PI) * 2 / 10
            sprite3d.x = sin(inc * CGFloat(i)) * 100
            sprite3d.z = cos(inc * CGFloat(i)) * 100
            sprite3d.y = -150
 
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
            sprite.rotate_3d(x: 0, y: 1, z: 0)
            sprite.render()
        }
    }
}
