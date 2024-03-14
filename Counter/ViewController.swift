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
    func textViewDidChange(_ counterChangeHistory: UITextView) {
            let cursorPosition = counterChangeHistory.selectedRange.location
            counterChangeHistory.scrollRangeToVisible(NSMakeRange(counterChangeHistory.text.count - 1, 0))
            counterChangeHistory.selectedRange = NSMakeRange(cursorPosition, 0)
        }
    //реализация прокрутки окна с текстом при добавлении нового текста
    
    private var count = 0
    //private var historyText: String = ""
    private let date = DateFormatter()
    // объявляем переменные для работы с историей изменений
    // count - счетчик, historyText - текст до изменения в UITextView, date - дата события
    @IBAction func increase(_ sender: Any) {
        count += 1
        date.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let currentDate = date.string(from: Date())
        counterChangeHistory.insertText("\n\(currentDate): значение изменено на +1")
        counterChangeLabel.text = "Значение счетчика: \(count)"
    }
    // увеличение счетчика на 1
    @IBAction func decrease(_ sender: Any) {
        if count > 0 {
            count -= 1
            date.dateFormat = "dd-MM-yyyy HH:mm:ss"
            let currentDate = date.string(from: Date())
            counterChangeHistory.insertText("\n\(currentDate): значение изменено на -1")
            counterChangeLabel.text = "Значение счетчика: \(count)"
        } else {
            date.dateFormat = "dd-MM-yyyy HH:mm:ss"
            let currentDate = date.string(from: Date())
            counterChangeHistory.insertText("\n\(currentDate): попытка уменьшить значение счетчика ниже 0")
        }
    // уменьшение счетчика на 1
    }
    @IBAction func reset(_ sender: Any) {
        count = 0
        date.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let currentDate = date.string(from: Date())
        counterChangeHistory.insertText("\n\(currentDate): значение сброшено")
        counterChangeLabel.text = "Значение счетчика: \(count)"
    }
    // сброс счетчика на 0
}

