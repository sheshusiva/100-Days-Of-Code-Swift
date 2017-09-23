//: Playground - noun: a place where people can play

import UIKit

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func sayHello() {
        print("Hello, there!")
    }
}

let person = Person(name: "Jay")
print(person.name)
person.sayHello()

// new class

class Vehicle {
    var currentSpeed = 0.0
    
    var description: String {
        return "traveling at \(currentSpeed) miles per hour."
    }
    
    func makeNoise() {
        // do nothing
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

//  The Bicycle class with the superclass of Vehicle.
/*
The new Bicycle class automatically inherits all of the properties and
methods of Vehicle, such as its currentSpeed and description
properties and its makeNoise() method.
 */

class Bicycle: Vehicle {
    var hasBasket = false
}
