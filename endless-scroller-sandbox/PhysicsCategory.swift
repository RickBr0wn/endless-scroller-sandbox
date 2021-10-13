//
//  PhysicsCategory.swift
//  endless-scroller-sandbox
//
//  Created by Rick Brown on 11/10/2021.
//

import Foundation

/*
 Bitwise Operations (or)
 
 000 | 001 = 001
 001 | 010 = 011
 
 Binary / Int / Description
 00000000 = 0 - None
 00000001 = 1 - Player
 00000010 = 2 - Ground
 00000011 = 3 - Reserved for contact delegate (Ground & Player)
 00000100 = 4 - Coin
 00000101 = 5 - Reserved for contact delegate (Player & Coin)
 00000110 = 6 - Reserved for contact delegate (Player & Ground)
 00000111 = 7 - Reserved for contact delegate (Ground, Player & Coin)
 00001000 = 8 - Deadly
 00001001 = 9 - Reserved for contact delegate (Player & Deadly)
 */
struct PhysicsCategory {
  static let None: UInt32 = 0
  static let Player: UInt32 = 0b1
  static let Ground: UInt32 = 0b10
  static let Coin: UInt32 = 0b100
  static let Deadly: UInt32 = 0b1000
}
