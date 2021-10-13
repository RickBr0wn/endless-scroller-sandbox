//
//  Player.swift
//  endless-scroller-sandbox
//
//  Created by Rick Brown on 11/10/2021.
//

import SpriteKit

class Player: SKSpriteNode {
  
  init() {
    let texture = SKTexture(imageNamed: "standing_01")
    super.init(texture: texture, color: UIColor.cyan, size: CGSize(width: 40, height: 60))
    setUp()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUp() {
    physicsBody = SKPhysicsBody(rectangleOf: self.size)
    physicsBody!.allowsRotation = false
    /*
     Player:
      category: PhysicsCategory.Player
      collision: PhysicsCategory.Ground
      contact: PhysicsCategory.Coin | PhysicsCategory.Player
     */
    physicsBody!.categoryBitMask = PhysicsCategory.Player
    physicsBody!.collisionBitMask = PhysicsCategory.Ground
    physicsBody!.contactTestBitMask = PhysicsCategory.Coin | PhysicsCategory.Player
  }
  
  
}
