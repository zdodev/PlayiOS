import UIKit

class ViewController: UIViewController {
    let progressCountView: ProgressCountView = {
        let progressCountView = ProgressCountView()
        progressCountView.translatesAutoresizingMaskIntoConstraints = false
        return progressCountView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(progressCountView)
        
        NSLayoutConstraint.activate([
            progressCountView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressCountView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        progressCountView.setProgress(count: 5)
        progressCountView.increase()
        progressCountView.increase()
        progressCountView.increase()
        progressCountView.increase()
        progressCountView.increase()
    }
}

