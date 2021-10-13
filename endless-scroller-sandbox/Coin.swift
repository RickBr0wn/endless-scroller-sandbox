//
//  Coin.swift
//  endless-scroller-sandbox
//
//  Created by Rick Brown on 11/10/2021.
//

import SpriteKit

class Coin: SKSpriteNode {
  init() {
    super.init(texture: nil, color: UIColor.yellow, size: CGSize(width: 20.0, height: 20.0))
    setUp()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUp() {
    physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
    physicsBody!.isDynamic = false
    /*
     Coin:
     category: PhysicsCategory.Coin
     collision: PhysicsCategory.None
     contact: PhysicsCategory.Player
     */
    physicsBody!.categoryBitMask = PhysicsCategory.Coin
    physicsBody!.collisionBitMask = PhysicsCategory.None
    physicsBody!.contactTestBitMask = PhysicsCategory.Player
  }
}
