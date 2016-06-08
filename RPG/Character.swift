//
//  Character.swift
//  RPG
//
//  Created by Ryan Ball on 08/06/2016.
//  Copyright © 2016 Ryan Ball. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp = 100
    private var _attackPwr = 10
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var isAlive: Bool {
        if _hp <= 0 {
            return false
        } else {
            return true
        }
    }
    
    init(startingHp: Int, attackPwr: Int) {
        self._hp = startingHp
        self._attackPwr = attackPwr
    }
    
    func attemptedAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        
        return true
    }
}
