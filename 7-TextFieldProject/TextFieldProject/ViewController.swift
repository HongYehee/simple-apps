//  ViewController.swift
//  TextFieldProject

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textField의 대리자는 self(즉, ViewController)
        textField.delegate = self
        
        setup()
    }
    
    func setup() {
        view.backgroundColor = UIColor.gray

        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "✉️ 이메일 주소를 입력하세요"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        
        // 키보드 올리기
        textField.becomeFirstResponder()
    }
    
    
    // 화면의 탭을 감지하는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // textField.resignFirstResponder()
    }
    
    
    // 텍스트필드의 입력이 시작될 때 호출되는 메서드 (시작 할지 말지 여부를 허락하는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function) // 함수의 이름 출력
        return true
    }
    
    // 시점
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("사용자가 텍스트필드 입력을 시작했습니다.")
    }
    
    // clear 허락 할지 말지
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드의 글자 내용이 한 글자씩 입력되거나 지워질 때 호출이 되고, 입력 허락 여부
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(#function)
//        print(string)
        
        // 숫자인 경우 입력 허용하지 않고, 10글자 입력 제한
        if Int(string) != nil { // 숫자로 변환된다면 nil이 아님
            return false
        } else {
            guard let text = textField.text else { return true }
            let newLength = text.count + string.count - range.length
            return newLength <= 10
        }
    }
    
    // 텍스트필드의 엔터 키가 눌렸을 때 다음 동작 허락 여부
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        if textField.text == "" {
            textField.placeholder = "⚠️ 이메일 주소를 입력해주세요!"
            return false
        } else {
            return true
        }
    }
    
    // 텍스트필드의 입력이 끝날 때 호출, 끝낼지 말지 허락
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드의 입력이 끝나는 시점에 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("입력이 끝났습니다.")
        textField.text = ""
    }

    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        // 키보드 내리기
        textField.resignFirstResponder()
    }
    
}
