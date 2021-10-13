//
//  GameScene.swift
//  endless-scroller-sandbox
//
//  Created by Rick Brown on 11/10/2021.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
  let player: Player
  let cameraNode: SKCameraNode
  var landscapes = Array<Landscape>()
  
  var touching: Bool = false
  
  override init(size: CGSize) {
    self.player = Player()
    self.cameraNode = SKCameraNode()
    super.init(size: size)
    setUp()
  }
  
  private func setUp() {
    physicsWorld.contactDelegate = self
    
    player.position = CGPoint(x: size.width / 2, y: size.height / 2)
    player.zPosition = 99
    addChild(player)
    
    camera = cameraNode
    cameraNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
    addChild(cameraNode)
    
    for index in 0..<2 {
      let landscape = Landscape(size: size)
      landscape.position.x = CGFloat(index) * landscape.size.width
      landscapes.append(landscape)
      addChild(landscape)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func didMove(to view: SKView) {
    
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 75))
    self.touching = true
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.touching = false
  }
  
  var lastUpdatedTime: TimeInterval = .zero
  
  override func update(_ currentTime: TimeInterval) {
    var deltaTime = currentTime - lastUpdatedTime
    
    if deltaTime > 1 {
      deltaTime = 1 / 60
    }
    
    lastUpdatedTime = currentTime
    
    if touching {
      // player.physicsBody?.applyForce(CGVector(dx: 0, dy: 260))
    }
    
    // player.physicsBody?.applyForce(CGVector(dx: 40, dy: 0))
    // player.position.x += 40.0 * CGFloat(deltaTime)
    let dy = player.physicsBody!.velocity.dy
    player.physicsBody!.velocity = CGVector(dx: 3000 * CGFloat(deltaTime), dy: dy)
    
    cameraNode.position.x = player.position.x
    
    scrollLandscapes()
  }
  
  private func scrollLandscapes() -> Void {
    for landscape in landscapes {
      let dx = landscape.position.x - cameraNode.position.x
      if dx < -(landscape.size.width + size.width / 2) {
        landscape.position.x += landscape.size.width * 2
        landscape.resetLandscape()
      }
    }
  }
  
  func didBegin(_ contact: SKPhysicsContact) {
    let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
    
    if collision == PhysicsCategory.Coin | PhysicsCategory.Player {
      print("** CONTACT BETWEEN PLAYER AND COIN **")
    }
    
    if collision == PhysicsCategory.Player | PhysicsCategory.Deadly {
      print("** CONTACT BETWEEN PLAYER AND DEADLY **")
    }
  }
}
