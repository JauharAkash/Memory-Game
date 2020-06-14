//
// Akash Jauhar
// Memory Game - Project 3
// CSC 184 - Professor Re
//
//  ViewController.swift
//  MemoryGame
//
//  Copyright © 2020 Akash Jauhar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //All the buttons/labels
    @IBOutlet weak var lblMovesMade: UILabel!
    @IBOutlet weak var lblMovesLeft: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    //used for moves made and moves left
    var flipCount = 0 {
        didSet {
            lblMovesMade.text = " \(flipCount)"}}
    
    var flipLeft = 20{
        didSet{
            lblMovesLeft.text = " \(flipLeft)"}}
    //Not initialized until "game" is used
    lazy var game: Model = Model(numberOfPairsOfCards: (cardButtons.count+1)/2)
    
    // Array to store all the food emojis used in the game
    var FoodEmoji = ["🍕", "🌮", "🍔", "🥯", "🎂", "🍣", "🍟", "🥨", "🥧", "🍿", "🍩", "🍝",]
  
    var emoji = [Int: String]()


   @IBAction func touchCard(_ sender: UIButton) {
    flipCount += 1;
    flipLeft -= 1;
    if (flipLeft == 0) {
    print("Game Over")
    }
    
    if let cardNumber = cardButtons.firstIndex(of: sender) {
        game.choosCard(at: cardNumber) // choosing cards
        
            updateViewFromModel()
        } else {
            print("N/A")
        }
    }
    
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
            } else {
                button.setTitle(" ", for: .normal)
            }
        }
    }
    
    func emoji(for card: brain) -> String {
        if emoji[card.identifier] == nil, FoodEmoji.count > 0 {
            let randomIndex = arc4random_uniform(UInt32(FoodEmoji.count))
            emoji[card.identifier] = FoodEmoji.remove(at: Int(randomIndex))
        }
        
        return emoji[card.identifier]!
        
    }
    
  //  override func viewDidLoad() {
  //      super.viewDidLoad()
        // Do any additional setup after loading the view.
  //  }

}
