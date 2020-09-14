//
//  ViewController.swift
//  Word Garden
//
//  Created by Jennifer Joseph on 9/13/20.
//  Copyright © 2020 Jennifer Joseph. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var flowerImageView: UIImageView!
    
    @IBOutlet weak var wordsGuessedLabel: UILabel!
    @IBOutlet weak var wordsRemainingLabel: UILabel!
    @IBOutlet weak var wordsMissedLabel: UILabel!
    @IBOutlet weak var wordsInGame: UILabel!
    
    @IBOutlet weak var wordBeingRevealedLabel: UILabel!
    
    @IBOutlet weak var guessLetterButton: UIButton!
    
    @IBOutlet weak var guessedLetterTextField: UITextField!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var gameStatusMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
    }
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
    }
}

