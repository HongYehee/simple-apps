//  UpDownManager.swift
//  UpDownGame

import Foundation

struct UpDownManager {
    // 컴퓨터가 랜덤으로 숫자 선택 (1...10)
    private var comNumber = Int.random(in: 1...10)
    
    // 내가 선택한 숫자를 담는 변수
    private var myNumber: Int = 1
    
    mutating func resetNum() {
        comNumber = Int.random(in: 1...10)
        myNumber = 1
    }
    
    mutating func setUsersNum(num: Int) {
        myNumber = num
    }
    
    func getUpDownResult() -> String {
        // 컴퓨터의 숫자와 내가 선택한 숫자를 비교 UP / Down / Bingo 리턴
        if comNumber > myNumber {
            return "Up"
        } else if comNumber < myNumber {
            return "Down"
        } else {
            return "Bingo😎"
        }
    }
}
