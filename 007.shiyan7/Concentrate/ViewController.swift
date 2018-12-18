//
//  ViewController.swift
//  Concentrate
//
//  Created by apple on 2018/10/22.
//  Copyright © 2018年 yanlu All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    lazy var game = Concentrate(numberOfPairsOfCards: (cardButtons.count + 1) / 2)  //卡牌的数量 加了lazy只有在有使用的时候才初始化
    var  flipCount = 0 {
        didSet{ //flip改变就运行
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }//这里还没用init初始化
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            updateViewFromModel()
        }else {
            print("chosen card was not in cardButtons")
        }
       // print("cardNumber = \(cardNumber)")
        
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    
    }
    
    var emojiChoices = ["🍭","👿","🎃","🦇","👻","🎭","😱"]
    
    var emoji = [Int:String]()
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil {
            if emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count))) //
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex) //避免重复使用图案
            }
        }
//        if emoji[card.identifier] != nil{
//            return emoji[card.identifier]!
//        }else {
//            return "?"
//        }
        return emoji[card.identifier] ?? "?"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

