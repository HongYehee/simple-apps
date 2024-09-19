//
//  main.swift
//  RandomBingo
//
//  Created by 홍예희 on 7/12/24.
//

import Foundation

var computerChoice = Int.random(in: 1...100)
var myChoice: Int = 0

while true {
    print("Select one number between 1 and 100 : ")
    var userInput = readLine()
    
    if let input = userInput {
        if let number = Int(input) {
            myChoice = number
        }
    }
    
    if computerChoice > myChoice {
        print("▲▲▲▲▲ Up! ▲▲▲▲▲\n")
    } else if computerChoice < myChoice {
        print("▼▼▼▼▼ Down! ▼▼▼▼▼\n")
    } else {
        print("★★★★★ Bingo! ★★★★★\n")
        break
    }
}
