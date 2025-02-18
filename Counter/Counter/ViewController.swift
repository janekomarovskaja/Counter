//
//  ViewController.swift
//  Counter
//
//  Created by Женя Комаровская on 12.02.2025.
//

import UIKit

class ViewController: UIViewController {
    private var countNumber: Int = 0

    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var changesHistory: UITextView!
    
    
    private func dateFormat() -> String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: currentDate)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter.text = "0"
        plusButton.tintColor = .red
        changesHistory.text = "История изменений:"
        changesHistory.isEditable = false
        changesHistory.isSelectable = false
    }

    @IBAction func increaseCountNumber(_ sender: Any) {
        countNumber += 1
        counter.text = "Значение счётчика:\n \(countNumber)"
        changesHistory.text += "\n\(dateFormat()) Значение изменено на +1"
    }
    
    @IBAction func decreaseCountNumber(_ sender: Any) {
        if countNumber > 0 {
            countNumber -= 1
            counter.text = "Значение счётчика:\n \(countNumber)"
            changesHistory.text += "\n\(dateFormat()) Значение изменено на -1"
        } else {
            changesHistory.text += "\n\(dateFormat()) Попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    @IBAction func resetCounter(_ sender: Any) {
            countNumber = 0
            counter.text = "Значение счётчика:\n \(countNumber)"
        changesHistory.text += "\n\(dateFormat()) Значение сброшено"
    }
}

