//: Playground - noun: a place where people can play

import UIKit

var hp = 90
let maxHP = 100
hp = 95

// Hello single line comment

/*  Hello multiline comment
    - More info here
    // Nested comment
 */

/// This is not a Hello World!
var notHelloWorld = "Hello Swift 4!"
print(notHelloWorld)

// type annotation
var typeInferred = 5
var typeExplicit: Int
// both annotation and inferred
var typeExplicitAndInferred: Double = 5.5

// Operators!

// Arithmetic
var math = 5 + 4 - 3 / 2 * 1

// Remainder %
var hpReminder = 10 % 9

// Compound assignments (+=, -=, *=, /=, 5=)
var currentMP = 15
currentMP -= 5

// Comparisons (==, !=, >, <, .=, ,=)
hp == maxHP
hp > currentMP

// Ternary operator
// If hp is less then 50, return 25, if it's not return 50
var bonusPoints = hp < 50 ? 25 : 50


