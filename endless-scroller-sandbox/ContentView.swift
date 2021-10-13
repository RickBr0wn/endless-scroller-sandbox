//
//  ContentView.swift
//  endless-scroller-sandbox
//
//  Created by Rick Brown on 11/10/2021.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
  private let scene = GameScene(size: UIScreen.main.bounds.size)
  
  var body: some View {
    SpriteView(scene: scene).edgesIgnoringSafeArea(.all)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    if #available(iOS 15.0, *) {
      ContentView()
        .previewInterfaceOrientation(.landscapeLeft)
    } else {
      // Fallback on earlier versions
    }
  }
}
