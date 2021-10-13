//
//  Ground.swift
//  endless-scroller-sandbox
//
//  Created by Rick Brown on 11/10/2021.
//

import SpriteKit

class Ground: SKSpriteNode {
  
  init(size: CGSize) {
    super.init(texture: nil, color: UIColor.clear, size: CGSize(width: size.width, height: 40))
    setUp()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUp() {
    physicsBody = SKPhysicsBody(rectangleOf: self.size)
    physicsBody!.isDynamic = false
    /*
     Ground:
     category: PhysicsCategory.Ground
     collision: PhysicsCategory.Player
     contact: PhysicsCategory.None
     */
    physicsBody!.categoryBitMask = PhysicsCategory.Ground
    physicsBody!.collisionBitMask = PhysicsCategory.Player
    physicsBody!.contactTestBitMask = PhysicsCategory.None
  }
}
