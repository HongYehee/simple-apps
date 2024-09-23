//  ViewController.swift
//  LoginProject

import UIKit

class ViewController: UIViewController {
    
    // 이메일 입력하는 텍스트 뷰
    private lazy var emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        //view.addSubview(emailTextField)
        //view.addSubview(emailInfoLabel)
        return view
    }()
    
    
    // "이메일주소 또는 전화번호" 안내 문구
    private var emailInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일주소 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    
    // 로그인 - 이메일 입력 텍스트필드
    private lazy var emailTextField: UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        //tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    
    // 비밀번호를 입력하는 텍스트뷰
    private var passwordTextFieldView: UIView { // lazy var로 수정하기
        let view = UIView()
        view.frame.size.height = 48
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        //view.addSubview(passwordTextField)
        //view.addSubview(passwordInfoLabel)
        //view.addSubview(passwordSecureButton)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    
    func makeUI() {
        
    }


}
