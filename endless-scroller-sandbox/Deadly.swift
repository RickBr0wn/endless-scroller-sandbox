//
//  Deadly.swift
//  endless-scroller-sandbox
//
//  Created by Rick Brown on 11/10/2021.
//

import SpriteKit

class Deadly: SKSpriteNode {
  init() {
    super.init(texture: nil, color: SKColor.red, size: CGSize(width: 50, height: 50))
    
    setUp()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUp() {
    physicsBody = SKPhysicsBody(rectangleOf: size)
    physicsBody!.isDynamic = false
    
    /*
     Deadly:
     category: PhysicsCategory.Deadly
     collision: PhysicsCategory.None
     contact: PhysicsCategory.Player
     */
    physicsBody!.categoryBitMask = PhysicsCategory.Deadly
    physicsBody!.collisionBitMask = PhysicsCategory.None
    physicsBody!.contactTestBitMask = PhysicsCategory.Player
  }
}
