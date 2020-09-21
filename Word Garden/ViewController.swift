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
    @IBOutlet weak var wordsInGameLabel: UILabel!
    @IBOutlet weak var wordBeingRevealedLabel: UILabel!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessedLetterTextField: UITextField!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var gameStatusMessageLabel: UILabel!
    
    var wordsToGuess = ["SWIFT","DOG","CAT"]
    var currentWordIndex = 0
    var wordToGuess = ""
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var wordsGuessedCount = 0
    var wordsMissedCount = 0
    var guessCount = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // so that guess a letter button is disabled when app is open
        let text = guessedLetterTextField.text!
        guessLetterButton.isEnabled = !(text.isEmpty)
        wordToGuess = wordsToGuess[currentWordIndex]
        wordBeingRevealedLabel.text = "_" + String(repeating: " _", count: wordToGuess.count-1)
    }
    
    func updateUIAfterGuesses() {
        // makes keyboard go away on app
        guessedLetterTextField.resignFirstResponder()
        guessedLetterTextField.text! = ""
        guessLetterButton.isEnabled = false
    }
    
    func formatRevealedWord() {
        var revealedWord = ""

        // loop through all letters in wordToGuess
        for letter in wordToGuess {
            // check if letter in wordToGuess is in lettersGuessed (i.e. did you guess this letter already?)
            if lettersGuessed.contains(letter) {
                // if so, add this letter + a blank space to revealedWord
                revealedWord = revealedWord + "\(letter) "
            } else {
                // if not, add an underscore + a blank space, to revealedWord
                revealedWord = revealedWord + "_ "
            }
        }
        // remove the extra space at the end of revealedWord
        revealedWord.removeLast()
        wordBeingRevealedLabel.text = revealedWord
    }
    
    func guessALetter() {
        // get current letter guessed and add it to all lettersGuessed
        let currentLetterGuessed = guessedLetterTextField.text!
        lettersGuessed = lettersGuessed + currentLetterGuessed
        
        //format and show revealedWord in wordBeingRevealedLabel to include new guess
        formatRevealedWord()
        
        // update image, if needed, and keep track of wrong guesses
        if !wordToGuess.contains(currentLetterGuessed) {
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
        
        //update game status message label
        guessCount += 1
        var guesses = "Guesses"
        if guessCount == 1 {
            guesses = "Guess"
        }
        gameStatusMessageLabel.text = "You've Made \(guessCount) \(guesses)"
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        //this hides the keyboard
       updateUIAfterGuesses()
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        guessALetter()
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
        guessLetterButton.isEnabled = !(sender.text!.isEmpty)
        
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

