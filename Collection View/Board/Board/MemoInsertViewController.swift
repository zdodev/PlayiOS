import UIKit

class MemoInsertViewController: UIViewController {
    let titleTextField = UITextField()
    let datePicker = UIDatePicker()
    let textView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureNavigationBar()
        configureUI()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "TODO"
        
        let rightBarButtonItem = UIBarButtonItem(systemItem: .done)
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        let leftBarButtonItem = UIBarButtonItem(systemItem: .cancel)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    private func configureUI() {
        titleTextField.placeholder = "Title"
        view.addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.backgroundColor = .systemGray6
        
        datePicker.preferredDatePickerStyle = .wheels
        view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        textView.backgroundColor = .systemGray6
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            titleTextField.heightAnchor.constraint(equalToConstant: 50),
            titleTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            titleTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            datePicker.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 10),
            datePicker.heightAnchor.constraint(equalToConstant: 200),
            datePicker.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            textView.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
            textView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -10),
            textView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
    }
}
