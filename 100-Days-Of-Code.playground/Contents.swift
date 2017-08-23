//: Playground - noun: a place where people can play

import UIKit

// Day 001

var sleep = 8

func sleepy() {
    if sleep < 8 {
        print("Get more sleep!")
    } else {
        print("Good job!")
    }
}

sleepy()

func time() {
    let week = 168
    let workDay = 8
    //let OneHundredDaysOfCode = 1
    
    let workWeek = workDay * 5
    let weeklySleep = sleep * 7
    let weeklySchedule = weeklySleep + workWeek
    
    if weeklySchedule < week {
        let myWeek = week - weeklySchedule
        print(myWeek)
        print(myWeek / 7)
    }
}

time()

struct Food {
    var name: String
    var ExpirationDate: Int
}

// Day 002




