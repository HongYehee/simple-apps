//  ViewController.swift
//  FirstNewApp

import UIKit
import AVFoundation


class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    weak var timer: Timer?
    var number: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    func configureUI() {
        mainLabel.text = "👇초를 선택하세요"
        slider.setValue(0.5, animated: true)
    }

    
    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더의 값에 따라 메인레이블의 텍스트 세팅
        number = Int(sender.value * 60)
        mainLabel.text = "⏳\(number)초"
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지날 때마다 무언가를 실행
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
        }
    
    @objc func doSomethingAfter1Second() {
        if number > 0 {
            number -= 1
            slider.setValue(Float(number) / Float(60), animated: true)
            mainLabel.text = "⏳\(number)초"
        } else {
            number = 0
            mainLabel.text = "👇초를 선택하세요"
            timer?.invalidate()
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }
    }
        
        
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화 세팅
        mainLabel.text = "👇초를 선택하세요"
        slider.setValue(0.5, animated: true)
        number = 0
        timer?.invalidate() // timer = nil
    }
    
}
