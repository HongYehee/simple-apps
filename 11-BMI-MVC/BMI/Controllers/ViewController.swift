//  ViewController.swift
//  BMI

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButon: UIButton!
    
    var bmiManager = BMICalculatorManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    
    func makeUI() {
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        mainLabel.text = "키와 몸무게를 입력해주세요"
        
        calculateButon.clipsToBounds = true
        calculateButon.layer.cornerRadius = 5
        calculateButon.setTitle("BMI 계산하기", for: .normal)
        
        heightTextField.placeholder = "cm 단위로 입력해주세요"
        weightTextField.placeholder = "kg 단위로 입력해주세요"
    }

    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력하셔야 합니다!"
            mainLabel.textColor = .red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해주세요"
        mainLabel.textColor = .black
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.bmi = bmiManager.getBMI(height: heightTextField.text!, weight: weightTextField.text!)
        }
        
        // 다음 화면으로 가기 전 텍스트필드 비우기
        heightTextField.text = ""
        weightTextField.text = ""
    }

    
}


extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 숫자일 때만 글자 입력 허용
        if Int(string) != nil || string == "" {
            return true
        }
        return false
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // 두 개의 텍스트필드 모두 종료 (키보드 내리기)
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        // 두 번째 텍스트필드로 넘어가기
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
    
}
