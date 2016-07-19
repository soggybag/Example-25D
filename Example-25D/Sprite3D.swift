//
//  Sprite3D.swift
//  Example-25D
//
//  Created by mitchell hudson on 7/18/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import Foundation
import SpriteKit

class Sprite3D: SKSpriteNode {
    let widget: CGFloat = CGFloat(M_PI / 180)
    var distance: CGFloat = 400
    var ox: CGFloat = 375 / 2
    var oy: CGFloat = 667 / 2
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    var z: CGFloat = 0
    
    var angleX: CGFloat = 0
    var angleY: CGFloat = 0
    var angleZ: CGFloat = 0
    
    func translate(x: CGFloat, y: CGFloat, z: CGFloat) {
        self.x += x
        self.y += y
        self.z += z
        
        render()
    }
    
    func position3D(x: CGFloat, y: CGFloat, z: CGFloat) {
        self.x = x
        self.y = y
        self.z = z
        
        render()
    }
    
    
    func rotate_3d(x x: CGFloat, y: CGFloat, z: CGFloat) {
        let aSin = sin(x * widget)
        let aCos = cos(x * widget)
        let bSin = sin(y * widget)
        let bCos = cos(y * widget)
        let cSin = sin(z * widget)
        let cCos = cos(z * widget)
        
        let x1 = self.x
        let y1 = (self.y * aCos) - (self.z * aSin)
        let z1 = (self.z * aCos ) + (self.y * aSin)
        // trace( "X1:" + x1 + " y1:" + y1 + " z1:" + z1 );
        let x2 = (x1 * bCos) - (z1 * bSin)
        let y2 = y1
        let z2 = (z1 * bCos) + (x1 * bSin)
        // trace( "X2:" + x2 + " y2:" + y2 + " z2:" + z2 );
        let x3 = (x2 * cCos) - (y2 * cSin)
        let y3 = (y2 * cCos) + (x2 * cSin)
        let z3 = z2;
        // trace( "X3:" + x3 + " y3:" + y3 + " z3:" + z3 );
        self.x = x3;
        self.y = y3;
        self.z = z3;
        
        render()
    }
    
    
    func render() {
        var p = distance / (distance + self.z)
        
        self.position.x = (self.x * p) + ox
        self.position.y = (self.y * p) + oy
        
        self.xScale = 1 * p
        self.yScale = 1 * p
        
        self.zPosition = 10000 - self.z
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        
        super.init(texture: texture, color: color, size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}