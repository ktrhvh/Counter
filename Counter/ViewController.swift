import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счётчика: 0"
        historyTextView.text = "История изменений:"
        historyTextView.isEditable = false
    }
    
    @IBAction func incrementTapped(_ sender: UIButton) {
        counter += 1
        counterLabel.text = "Значение счётчика: \(counter)"
        addHistory("значение изменено на +1")
    }
    
    @IBAction func decrementTapped(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
            counterLabel.text = "Значение счётчика: \(counter)"
            addHistory("значение изменено на -1")
        } else {
            addHistory("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func resetTapped(_ sender: UIButton) {
        counter = 0
        counterLabel.text = "Значение счётчика: 0"
        addHistory("значение сброшено")
    }
    
    func addHistory(_ event: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let date = formatter.string(from: Date())
        let newEntry = "[\(date)]: \(event)\n"
        let currentText = historyTextView.text ?? ""
        historyTextView.text = "История изменений:\n" + newEntry + currentText.replacingOccurrences(of: "История изменений:\n", with: "")
    }
}
