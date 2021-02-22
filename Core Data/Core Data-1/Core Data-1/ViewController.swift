import UIKit

final class ViewController: UITableViewController {
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private let rightBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(systemItem: .add)
        return barButtonItem
    }()
    private var items: [Book]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupNavigationBar()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        fetchItems()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Library"
        navigationItem.rightBarButtonItem = rightBarButtonItem
        rightBarButtonItem.target = self
        rightBarButtonItem.action = #selector(addTapped)
    }
    
    private func fetchItems() {
        do {
            items = try context.fetch(Book.fetchRequest())
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @objc private func addTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add book", message: "What is a book name?", preferredStyle: .alert)
        alert.addTextField()
        
        let summitButton = UIAlertAction(title: "Add", style: .default) { alertAction in
            let textField = alert.textFields![0]
            
            // 생성
            let newBook = Book(context: self.context)
            newBook.subject = textField.text
            
            // 저장
            do {
                try self.context.save()
            } catch {
                print(error.localizedDescription)
            }
            self.fetchItems()
        }
        alert.addAction(summitButton)
        present(alert, animated: true)
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items![indexPath.row].subject
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, completionHandler in
            // 삭제할 아이템 선택
            let bookToRemove = self.items![indexPath.row]
            
            // 아이템 삭제
            self.context.delete(bookToRemove)
            
            // 저장
            do {
                try self.context.save()
            } catch {
                print(error.localizedDescription)
            }
            
            self.fetchItems()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = self.items![indexPath.row]
        
        let alert = UIAlertController(title: "Edit Book", message: "Edit name:", preferredStyle: .alert)
        alert.addTextField()
        
        let textField = alert.textFields![0]
        textField.text = book.subject
        
        let updateButton = UIAlertAction(title: "Update", style: .default) { alertAction in
            // 이름 변경
            book.subject = textField.text
            
            do {
                try self.context.save()
            } catch {
                print(error.localizedDescription)
            }
            
            self.fetchItems()
        }
        alert.addAction(updateButton)
        present(alert, animated: true)
    }
}
