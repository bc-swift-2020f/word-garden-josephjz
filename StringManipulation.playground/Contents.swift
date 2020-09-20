import UIKit



// contains


var myName = "Joseph"
var smallerString = "ose"

// using .contains() with StringProtocol because we are looking for a String within a String
// .contains() retuns a Bool
if myName.contains(smallerString) {
    print("\(myName) contains \(smallerString)")
} else {
    print("There is no \(smallerString) in \(myName)")
}



// hasPrefix and hasSuffix


var occupation = "Swift Developer"
var searchString = "Swift"

print("\nPREFIX SEARCH")

print(occupation.hasPrefix(searchString)) //prints true because hasPrefix returns a bool

if occupation.hasPrefix(searchString) {
    print("You're hired!")
} else {
    print("No job for you.")
}

print("\nSUFFIX SEARCH")

occupation = "iOS Developer"
searchString = "Developer"

if occupation.hasSuffix(searchString) {
    print("You're hired! We need more \(occupation)s")
} else {
    print("No job for you.")
}



// removeLast


print("\nREMOVE")
var bandName = "The White Stripes"

// the .removeLast() function removes and returns the last element of the collection
// think of pop()
// Strings are collections (so in this case, the last character will be removed), but so are other structures like arrays
// you CANNOT call .removeLast() on constants because it will modify whatever it is called on

let lastChar = bandName.removeLast()
print("After we remove \(lastChar) the band is just \(bandName).")



// removeFirst(k: Int)


print("\nREMOVE FIRST #")
var person = "Dr. Nick"
let title = "Dr."

// .removeFirst() removes and returns the first character in a String or the first element in an array
//person.removeFirst()

// .removeFirst(k: Int) is a function with return type Void that removes specified number of characters, elements from beginning of string, array
// using title.count will remove any title that we put in title var so that it will remove the # of characters in our title from the person
// add 1 for the white space
person.removeFirst(title.count+1)
print(person)



// .replacingOccurances(of: with:)



// really helpful with data cleaning
print("\nREPLACING OCCURANCES #")

// when you have the "same" data, but written slightly differently, and thus counted separately
// fixes this

// example: 123 James St. 123 James St 123 James Street
var address = "123 James St."
var streetString = "St."
var replacementString = "Street"

//.replacingOccurrences(of: with:) returns a new string with all the occurances of the target string replaced by another string (what follows the width argument)
var standardAddress = address.replacingOccurrences(of: streetString, with: replacementString)
print(standardAddress,address)



// Iterate through a String


print("\nBACKWARDS STRING")

var name = "Jennifer"
var backwardsName = ""
for letter in name {
    backwardsName = String(letter) + backwardsName
}
print("\(name), \(backwardsName)")

// could also use .reversed()
// for letter in name.reversed() {
//      backwardsName += String(letter) }
// print("\(name), \(backwardsName)")



// Capitalization


print("\nPLAYING W CAPS ")
var crazyCaps = "SwIfT dEvElOpEr"
// .uppercased() returns an uppercased version of the string
var uppercased = crazyCaps.uppercased()
// same for lower
var lowercased = crazyCaps.lowercased()
// capitalizing String ----- .capitalized is a property, but the other two are methods
var capitalized = crazyCaps.capitalized

// none of these change crazyCaps
print(crazyCaps, uppercased, lowercased, capitalized)







// CODE FOR WORD GARDEN
var wordToGuess = "SWIFT"
var revealedWord = ""

// could also have written for loop as for _ in wordToGuess because we never use letter in the loop, and _ works as an unspecified place holder
for letter in wordToGuess {
    revealedWord = revealedWord + "_ "
}

// also another option for getting the spacing and _ to display properly
// this assumes word has at least 2 letters
//for _ in 1...wordToGuess.count - 1 {
//    revealedWord = revealedWord + " _"
//}

//this will get rid of extra space at the end -- remember this doesn't make a new string, but changes revealedWord
revealedWord.removeLast()
print("\(wordToGuess) will show as '\(revealedWord)'")

//create a string from a repeating value
// this creates a new string representing the given string repeated the specified number of times
revealedWord = "_" + String(repeating: " _", count: wordToGuess.count-1)
print("using repeating string: '\(revealedWord)'")



// REVEAL WORD

print("\nREVEAL WORD")
wordToGuess = "SWIFT"
var lettersGuessed = "ABC"
revealedWord = ""

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

print("wordToGuess = \(wordToGuess)")
print("lettersGuessed = \(lettersGuessed)")
print("revealedWord = \(revealedWord)")


