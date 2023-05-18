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
    private var gameBlocks : [SKSpriteNode] = []

    override func didMove(to view: SKView) -> Void
    {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        loadSand()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) -> Void
    {
        guard let touch = touches.first
        else{ return }
        
        let location = touch.location(in: self)
        if ( !gameBlocks.isEmpty)
        {
            let node = gameBlocks.removeFirst()
            node.position = location
            
            addChild(node)
        }
        
    }
    
    
    
    
    func loadSand() -> Void
        {
            for _ in 0 ..< 15000
            {
                let currentColor = assignColorAndBitMask()
                var width = 5
                var height = 5
                
                if height != 5 || width != 5
                {
                    width = 5
                    height = 5
                }
                
                let node: SKSpriteNode
                node = SKSpriteNode(color: currentColor, size: CGSize( width: width, height: height))
                
                node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: width, height: height))
                node.physicsBody?.contactTestBitMask = UInt32(colorMask)
                gameBlocks.append(node)
            }
        }

        
        func assignColorAndBitMask() -> UIColor
        {
            let colors : [UIColor] = [.yellow, .orange, .yellow]
            let randomIndex = Int(arc4random()) % colors.count
            colorMask = randomIndex + 1
            
            return colors[randomIndex]
        }
}
