import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var historyTextView: UITextView!
    
    // MARK: - Properties
    
    private var counter = 0
    private let historyTitle = "История изменений:"
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateCounterLabel()
    }
    
    // MARK: - Actions
    
    @IBAction private func incrementTapped(_ sender: UIButton) {
        counter += 1
        updateCounterLabel()
        addHistory("значение изменено на +1")
    }
    
    @IBAction private func decrementTapped(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
            updateCounterLabel()
            addHistory("значение изменено на -1")
        } else {
            addHistory("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func resetTapped(_ sender: UIButton) {
        counter = 0
        updateCounterLabel()
        addHistory("значение сброшено")
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        historyTextView.text = historyTitle
        historyTextView.isEditable = false
    }
    
    private func updateCounterLabel() {
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    private func addHistory(_ event: String) {
        let date = formatter.string(from: Date())
        let newEntry = "[\(date)]: \(event)\n"
        historyTextView.text += "\n" + newEntry
        scrollToBottom()
    }
    
    private func scrollToBottom() {
        let range = NSRange(location: historyTextView.text.count - 1, length: 1)
        historyTextView.scrollRangeToVisible(range)
    }
}
