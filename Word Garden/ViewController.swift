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
        
        // so that guess a letter button is disabled when app is open
        let text = guessedLetterTextField.text!
        guessLetterButton.isEnabled = !(text.isEmpty)
    }
    
    func updateUIAfterGuesses() {
        // makes keyboard go away on app
        guessedLetterTextField.resignFirstResponder()
        guessedLetterTextField.text! = ""
        guessLetterButton.isEnabled = false
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        //this hides the keyboard
       updateUIAfterGuesses()
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        //this hides the keyboard
       updateUIAfterGuesses()
    }
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        // guessedLetterTextField is an @IBOutlet
        // guessedLetterFieldChanged is an @IBAction that is tied to text field that is also named with IBOutlet text field ; here, this TextField is assigned to the variable sender, so we can use that instead of... (next comment)
        // could use let text = guessedLetterTextField.text! also
        // but we are going to move it down to the nil coallescing code line anyways
        // var text = sender.text!
        
        // text.last will look at the last letter typed
        // if it is non nil, we will get the last character
        // otherwise we get a space, which we have to covert over to a string before we can assignn it to text
        // have to use space " " not empty string "" because .last gives us back a character
        // sender is a constant, but the properties inside of it are mutable
        sender.text = String(sender.text?.last ?? " ").trimmingCharacters(in: .whitespaces)
        guessLetterButton.isEnabled = !(text.isEmpty)
        
//        if let lastCharacter = text.last {
//            guessedLetterTextField.text = String(lastCharacter)
//        } else {
//            guessedLetterTextField.text = " "
//        }
//
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        // gets contents of text field and checks if it is empty or not
        // could also do this by checking .count == 0
        // if text.isEmpty is true, text is a empty string
        let text = guessedLetterTextField.text!
        
        // enable button when you can make a guess (shouldnt be able to click guess button if there is no guess)
        
        guessLetterButton.isEnabled = !(text.isEmpty)
    }
    
}

