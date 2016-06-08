//
//  ViewController.swift
//  RPG
//
//  Created by Ryan Ball on 07/06/2016.
//  Copyright © 2016 Ryan Ball. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
   
    @IBOutlet weak var attackLabel: UILabel!
    
    @IBOutlet weak var player1HpLabel: UILabel!
    
    @IBOutlet weak var player2HpLabel: UILabel!
    
    @IBOutlet weak var player1Button: UIButton!
    
    @IBOutlet weak var player2Button: UIButton!
    
    @IBOutlet weak var player1AttackLabel: UILabel!
    
    @IBOutlet weak var player2AttackLabel: UILabel!
    
    var bgMusic: AVAudioPlayer!
    
    var player1: Player!
    var player2: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = NSBundle.mainBundle().pathForResource("BGMusic", ofType: "mp3")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do {
            try bgMusic = AVAudioPlayer(contentsOfURL: soundURL)
            bgMusic.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        playSound()
        
        player1 = Player(name: "Player 1", hp: 100, attackPwr: Int(arc4random_uniform(20)))
        player1HpLabel.text = "\(player1.hp) HP"
        
        player2 = Player(name: "Player 2", hp: 100, attackPwr: Int(arc4random_uniform(20)))
        player2HpLabel.text = "\(player2.hp) HP"
        
    }
    
    @IBAction func player1AttackButton(button: UIButton!) {
        
        if player2.attemptedAttack(Int(arc4random_uniform(20))) {
            attackLabel.text = "Attacked \(player2.name) for \(player1.attackPwr) HP"
            player2HpLabel.text = "\(player2.hp) HP"
        } else {
            attackLabel.text = "Attack was unsuccessful!"
        }
//        player2Button.hidden = true
//        player2AttackLabel.hidden = true
        
    }
    
    @IBAction func player2AttackButton(button: UIButton!) {
        
        if player1.attemptedAttack(Int(arc4random_uniform(20))) {
            attackLabel.text = "Attacked \(player1.name) for \(player2.attackPwr) HP"
            player1HpLabel.text = "\(player1.hp) HP"
        } else {
            attackLabel.text = "Attack was unsuccessful!"
        }
        
    }
    
    func playSound() {
        if bgMusic.playing {
            bgMusic.stop()
        }
        bgMusic.play()
    }
    
    }