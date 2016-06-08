//
//  Player.swift
//  RPG
//
//  Created by Ryan Ball on 08/06/2016.
//  Copyright © 2016 Ryan Ball. All rights reserved.
//

import Foundation

class Player: Character {
    
    private var _name = "Player"
    
    var name: String {
        get{
            return _name
        }
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHp: hp, attackPwr: attackPwr)
        
        _name = name
    }
}