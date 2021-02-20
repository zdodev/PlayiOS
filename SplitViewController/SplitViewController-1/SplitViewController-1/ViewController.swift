import UIKit

class ViewController: UIViewController {
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 70))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.backgroundColor = .systemBlue
        button.setTitle("Present", for: .normal)
        view.addSubview(button)
        view.backgroundColor = .white
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        button.center = view.center
    }
    
    @objc private func didTapButton() {
        let splitVC = UISplitViewController(style: .doubleColumn)
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .systemBlue
        secondVC.title = "Home"
        //        splitVC.setViewController(<#T##vc: UIViewController?##UIViewController?#>, for: <#T##UISplitViewController.Column#>)
        
        splitVC.viewControllers = [
            UINavigationController(rootViewController: MenuController(style: .plain)),
            UINavigationController(rootViewController: secondVC)
        ]
        present(splitVC, animated: true)
//        print(splitVC.)
    }
}

class MenuController: UITableViewController {
    override init(style: UITableView.Style) {
        super.init(style: style)
        title = "Memu"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Option \(indexPath.row)"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
