//
//  Physics.swift
//  CreateTask
//
//  Created by Winsor, Orion on 11/29/22.
//

import SwiftUI
import SpriteKit

class Physics : SKScene, SKPhysicsContactDelegate
{
    private var colorMask : Int = 0b0000
    
    override func touchesBegan(_ touches : Set<UITouch>, with event : UIEvent?) -> Void
    {
        guard let touch = touches.first
        else{ return }
        
        let location = touch.location(in: self)
        
        func loadSand() -> Void
        {
            for _ in 0 ..< 160
            {
                let currentColor = assignColorAndBitMask()
                var width = 50
                var height = 50
                
                let node: SKSpriteNode
                node = SKSpriteNode(color: currentColor, size: CGSize( width: width, height: height))
            }
        }

        
        func assignColorAndBitMask() -> UIColor
        {
            let colors : [UIColor] = [.yellow]
            let randomIndex = Int(arc4random()) % colors.count
            colorMask = randomIndex + 1
            
            return colors[randomIndex]
        }

    }
    
    
    
    
}
