//
//  Landscape.swift
//  endless-scroller-sandbox
//
//  Created by Rick Brown on 11/10/2021.
//

import SpriteKit

class Landscape: SKNode {
  let background: SKSpriteNode
  let ground: Ground
  let contentNode: SKNode
  let size: CGSize
  
  init(size: CGSize) {
    // self.size = size
    // let hue = CGFloat(arc4random() % 1000) / 1000
    // self.background = SKSpriteNode(color: SKColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 0.5), size: size)
    self.background = SKSpriteNode(imageNamed: "background")
    print("background size: \(self.background.size)")
    self.size = CGSize(width: self.background.size.width, height: size.height)
    self.ground = Ground(size: CGSize(width: self.background.size.width, height: size.height))
    self.contentNode = SKNode()
    super.init()
    setUp()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUp() {
    background.anchorPoint = CGPoint(x: 0.0, y: 0.0)
    addChild(background)
    
    ground.position = CGPoint(x: size.width / 2, y: ground.size.height / 2)
    addChild(ground)
    
    addChild(contentNode)
  }
  
  func resetLandscape() {
    // self.background.color = randomColor()
    
    contentNode.removeAllChildren()
    
    let num = arc4random() % 2
    
    switch num {
    case 0:
      // create coin
      let coin = Coin()
      coin.position.x = CGFloat(arc4random() % UInt32(size.width))
      coin.position.y = CGFloat(arc4random() % UInt32(size.height - 100)) + 40
      coin.zPosition = 99
      contentNode.addChild(coin)
    case 1:
      // create a deadly object
      let deadly = Deadly()
      deadly.position.x = CGFloat(arc4random() % UInt32(size.width - deadly.size.width)) + deadly.size.width / 2
      deadly.position.y = 40 + deadly.size.height / 2
      contentNode.addChild(deadly)
    default:
      break
    }
  }
  
  private func randomColor() -> UIColor {
    let hue = CGFloat(arc4random() % 1000) / 1000
    return UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 0.5)
  }
}
