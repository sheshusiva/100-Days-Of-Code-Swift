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
