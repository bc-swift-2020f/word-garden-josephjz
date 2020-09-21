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
        updateGameStatusLabels()

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
    
    
    func updateAfterWinOrLose() {
        // what do we do if the game is over?
        // - disable guessALetterTextField
        // - increment currentWordIndex by 1
        // - disable guessALetterButton
        // - set playAgainButton .isHidden to false
        // - update all labels at the top of the screen
        
        currentWordIndex += 1
        guessedLetterTextField.isEnabled = false
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = false
        
        updateGameStatusLabels()
    }
    
    func updateGameStatusLabels() {
        //update labels on top of screen
        wordsGuessedLabel.text = "Words Guessed: \(wordsGuessedCount)"
        wordsMissedLabel.text = "Words Missed: \(wordsMissedCount)"
        wordsRemainingLabel.text = "Words to Guess: \((wordsToGuess.count - (wordsGuessedCount + wordsMissedCount)))"
        wordsInGameLabel.text = "Words in Game: \(wordsToGuess.count)"
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
//        var guesses = "Guesses"
//        if guessCount == 1 {
//            guesses = "Guess"
//        }
        let guesses = (guessCount == 1 ? "Guess" : "Guesses")
        gameStatusMessageLabel.text = "You've Made \(guessCount) \(guesses)"
        
        // After each guess, check to see if 2 things happen:
        // 1) the user won the game
        // - all letters are guessed, so there are no more underscores in wordBeingRevealed.text
        // 2) the user may have lost the game
        // - wrongGuessesRemaining = 0
        // - handle game over
        // else continue to play
        
        if wordBeingRevealedLabel.text!.contains("_") == false {
            gameStatusMessageLabel.text = "You've guessed it! It took you \(guessCount) to guess the word."
            wordsGuessedCount += 1
            updateAfterWinOrLose()
        } else if wrongGuessesRemaining == 0 {
            gameStatusMessageLabel.text = " ☹️ Out of guesses ☹️ "
            wordsMissedCount += 1
            updateAfterWinOrLose()
        }
        
        // check to ee if you have played all the words
        // if so, update the message indicating the player can restart the entire game
        if currentWordIndex == wordsToGuess.count {
            gameStatusMessageLabel.text! += "\n\n You've tried all of the words! Restart from the beginning?"
        }
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
        // if all words have been guessed and you've selected playAgain, then restart all games as if the app had been restarted
        if currentWordIndex == wordsToGuess.count {
            currentWordIndex = 0
            wordsGuessedCount = 0
            wordsMissedCount = 0
        }
        
        // hide playAgainButton
        // enable letterGuessedTextField
        // disable guessALetterButton - it already is though
        // currentWord should be set to next word
        // setWordBeingRevealed.text to underscores separated by spaces
        // set wrongGuessesRemaining to maxNumberOfWrongGuesses
        // set guessCount = 0
        // set flowerImageView to flower8
        // clear out lettersGuessed, so new word restarts w no letters guessed, or = ""
        // set gameStatusMessageLabel.text to "You've Made 0 Guesses."
        
        playAgainButton.isHidden = true
        guessedLetterTextField.isEnabled = true
        guessLetterButton.isEnabled = false // don't turn true until a character is in the text field
        wordToGuess = wordsToGuess[currentWordIndex]
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        //create word with underscores, one for each space
        wordBeingRevealedLabel.text = "_" + String(repeating: " _", count: wordToGuess.count-1)
        guessCount = 0
        flowerImageView.image = UIImage(named: "flower\(maxNumberOfWrongGuesses)")
        lettersGuessed = ""
        updateGameStatusLabels()
        gameStatusMessageLabel.text = "You've Made 0 Guesses"
    }
    
}

