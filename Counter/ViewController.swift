//
//  ViewController.swift
//  Counter
//
//  Created by Владислав Сёмин on 12.03.2024.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var counterChangeHistory: UITextView!
    @IBOutlet weak var counterButtonReset: UIButton!
    @IBOutlet weak var counterButtonIncrease: UIButton!
    @IBOutlet weak var counterButtonDecrease: UIButton!
    @IBOutlet weak var counterChangeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        counterButtonReset.tintColor = .black
        counterButtonIncrease.tintColor = .black
        counterButtonDecrease.tintColor = .black
        counterChangeHistory.delegate = self
        // Do any additional setup after loading the view.
    }
    
    private var count = 0
    private var historyText: String = ""
    private let date = DateFormatter()
    // объявляем переменные для работы с историей изменений
    // count - счетчик, historyText - текст до изменения в UITextView, date - дата события
    @IBAction func increase(_ sender: Any) {
        count += 1
        date.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let currentDate = date.string(from: Date())
        historyText = counterChangeHistory.text
        counterChangeHistory.scrollsToTop = true
        counterChangeHistory.text = "\(currentDate): значение изменено на +1\n\(historyText)"
        counterChangeLabel.text = "Значение счетчика: \(count)"
    }
    // увеличение счетчика на 1
    @IBAction func decrease(_ sender: Any) {
        if count > 0 {
            count -= 1
            date.dateFormat = "dd-MM-yyyy HH:mm:ss"
            let currentDate = date.string(from: Date())
            historyText = counterChangeHistory.text
            counterChangeHistory.text = "\(currentDate): значение изменено на -1\n\(historyText)"
            counterChangeLabel.text = "Значение счетчика: \(count)"
        }
    // уменьшение счетчика на 1
    }
    @IBAction func reset(_ sender: Any) {
        count = 0
        date.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let currentDate = date.string(from: Date())
        historyText = counterChangeHistory.text
        counterChangeHistory.text = "\(currentDate): значение сброшено\n\(historyText)"
        counterChangeLabel.text = "Значение счетчика: \(count)"
    }
    // сброс счетчика на 0
}

