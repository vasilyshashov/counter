//
//  ViewController.swift
//  Counter
//
//  Created by Vasily on 25.11.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var dataTextView: UITextView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var escButton: UIButton!
    
    private var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "\(number)"
        dataTextView.text = "История изменений:"
        dataTextView.isEditable = false
        dataTextView.isScrollEnabled = true
    }
    
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: date)
    }
    
    @IBAction func changePlusButton(_ sender: Any) {
    number += 1
        numberLabel.text = "\(number)"
        let currentDate = Date()
        dataTextView.text = "(\(formatDate(currentDate))\n Значение изменено на +1)"
    }
    
    @IBAction func changeMinusButton(_ sender: Any) {
        number -= 1
        numberLabel.text = "\(number)"
        if number < 0 {
            number = 0
            let currentDate = Date()
            dataTextView.text = "(\(formatDate(currentDate))\n Попытка уменьшить значение счетчика ниже 0)"
            self.numberLabel.text = "\(number)"
        }
        else{
            let currentDate = Date()
            dataTextView.text = "(\(formatDate(currentDate))\n Значение изменено на -1)"
        }
    }
    
    @IBAction func changeEscButton(_ sender: Any) {
       number = 0
        numberLabel.text = "\(number)"
        let currentDate = Date()
        dataTextView.text = "(\(formatDate(currentDate))\n Значение сброшено)"
    }
}

