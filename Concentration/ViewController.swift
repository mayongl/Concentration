//
//  ViewController.swift
//  Concentration
//
//  Created by Yong Lin Ma on 2018/6/23.
//  Copyright © 2018 Yong Lin Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var flipCount = 0 { didSet {
        flipCountLabel.text = "Flips: \(flipCount)"
        }}
    
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
        
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1) : #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            }
        }
        
    }
    
    var emojiChoice = ["😄","🤡","👹","☠️","👽","👻","🤖","👣","🦊","🐌","🐝","🙈"]
    
    var emoji = [Int : String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil {
            if emojiChoice.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoice.count)))
                emoji[card.identifier] = emojiChoice.remove(at: randomIndex)
            }
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
    
    
}

