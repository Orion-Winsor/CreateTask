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

    override func didMove(to view: SKView)
    {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        loadSand()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        guard let touch = touches.first
        else{ return }
        
        let location = touch.location(in: self)
    }
    
    func loadSand() -> Void
        {
            for _ in 0 ..< 160
            {
                let currentColor = assignColorAndBitMask()
                var width = 50
                var height = 50
                
                if height != 50 || width != 50
                {
                    width = 50
                    height = 50
                }
                
                let node: SKSpriteNode
                node = SKSpriteNode(color: currentColor, size: CGSize( width: width, height: height))
                
                node.position = location
                node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: width, height: height))
                node.physicsBody?.contactTestBitMask = UInt32(colorMask)
                gameBlocks.append(node)
            }
        }

        
        func assignColorAndBitMask() -> UIColor
        {
            let colors : [UIColor] = [.yellow]
            let randomIndex = Int(arc4random()) % colors.count
            colorMask = randomIndex + 1
            
            return colors[randomIndex]
        }

    private func collision(_ nodeOne : SKNode, and nodeTwo: SKNode) -> Void
    {
        if(nodeOne.physicsBody?.contactTestBitMask ==
           nodeTwo.physicsBody?.contactTestBitMask)
        {
            //unneded
        }
    }
    
    func didBegin(_ contact : SKPhysicsContact) -> Void
    {
        guard let first = contact.bodyA.node else {return}
        guard let second = contact.bodyB.node else { return }
        
        collision(first, and: second)
    }
    
    
    
    
}
