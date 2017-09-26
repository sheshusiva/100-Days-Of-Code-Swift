//: Playground - noun: a place where people can play

import UIKit


func fizzBuzz(_ number: Int) -> String {
    if number % 3 == 0 && number % 5 == 0 {
        return "Fizz Buzz"
    } else if number % 3 == 0 {
        return "Fizz"
    } else if number % 5 == 0 {
        return "Buzz"
    } else {
        return String(number)
    }
}

fizzBuzz(3)
fizzBuzz(5)
fizzBuzz(15)
fizzBuzz(16)


let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

for num in numbers {
    if num % 3 == 0 && num % 5 == 0 {
        print("\(num) Fizz Buzz")
    } else if num % 3 == 0 {
        print("\(num) Fizz")
    } else if num % 5 == 0 {
        print("\(num) Buzz")
    } else {
        print(num)
    }
}
