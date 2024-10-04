//  SecondViewController.swift
//  BMI

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    // 전 화면에서 전달받은 BMI를 저장하기 위한 변수
    var bmi: BMI?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        guard let bmi = bmi else { return }
    }
    
    
    func configureUI() {
        // 전화면에서 전달받은 BMI를 통해 세팅
        bmiNumberLabel.text = "\(bmi!.value)"
        bmiNumberLabel.backgroundColor = bmi?.matchColor
        adviceLabel.text = bmi?.advice
        
        // UI셋팅
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8

        backButton.layer.cornerRadius = 5
        backButton.setTitle("다시 계산하기", for: .normal)
    }
    
    
    // 다시 계산하기 버튼 눌렀을 때
    @IBAction func backButtonTapped(_ sender: UIButton) {
        // 전 화면으로 돌아가는 메서드
        self.dismiss(animated: true, completion: nil)
    }
    
}
