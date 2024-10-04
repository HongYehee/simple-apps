//
//  ViewController.swift
//  UpDownGame
//
//  Created by 홍예희 on 7/13/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    // 컴퓨터가 랜덤으로 1~10 숫자 선택
    var comNumber = Int.random(in: 1...10)
    // 내가 선택한 숫자 (1로 초기화)
    // var myNumber = 1
    
    
    
    // 앱의 화면에 들어오면 가장 처음 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 메인 레이블에 "선택하세요" 표시하기
        mainLabel.text = "선택하세요"
        // 숫자 레이블에는 "" 표시하기
        numberLabel.text = ""
    }

    

    @IBAction func buttonTapped(_ sender: UIButton) {
        // 버튼의 숫자 가져오기
        guard let numString = sender.currentTitle else { return }
        // 선택한 숫자에 따라 숫자 레이블이 변하도록 하기
        numberLabel.text = numString
        // 선택한 숫자를 숫자로 변환한 후 변수에 저장하기 (선택사항)
        // guard let num = Int(numString) else { return }
        // myNumber = num
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 내가 선택한 숫자 : 숫자 레이블에 있는 문자열 가져와서 옵셔널 벗기고 정수로 변환
        guard let myNumString = numberLabel.text else { return }
        guard let myNumber = Int(myNumString) else { return }
        
        // 컴퓨터가 선택한 숫자와 내가 선택한 숫자를 비교해서 메인 레이블에 Up/Down/Bingo 표시
        if comNumber > myNumber {
            mainLabel.text = "Up 👍"
        } else if comNumber < myNumber {
            mainLabel.text = "Down 👎"
        } else {
            mainLabel.text = "Bingo! 🎉"
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 메인 레이블에 다시 "선택하세요" 표시
        mainLabel.text = "선택하세요"
        // 숫자 레이블에 다시 "" 표시
        numberLabel.text = ""
        // 컴퓨터가 랜덤 숫자를 다시 선택
        comNumber = Int.random(in: 1...10)
    }
}
