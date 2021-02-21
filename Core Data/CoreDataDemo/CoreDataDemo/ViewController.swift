import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    // Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Data for the table
    var items: [Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PersonCell")
        
        // Get items from Core Data
        fetchPeople()
    }
    
    func fetchPeople() {
        // Fetch the data from Core Data to display in the tableview
        do {
            items = try context.fetch(Person.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
        // Create alert
        let alert = UIAlertController(title: "Add Person", message: "What is their name?", preferredStyle: .alert)
        alert.addTextField()
        
        // Configure button handler
        let submitButton = UIAlertAction(title: "Add", style: .default) { action in
            
            // Get the textfield for the alert
            let textfield = alert.textFields![0]
            
            // TODO: Create a person object
            let newPerson = Person(context: self.context)
            newPerson.name = textfield.text
            newPerson.age = 20
            newPerson.gender = "Male"
            
            // TODO: Save the data
            do {
                try self.context.save()
            } catch {
                print(error.localizedDescription)
            }
            
            // TODO: Re-fetch the data
            self.fetchPeople()
        }
        
        alert.addAction(submitButton)
        present(alert, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        
        // Get person from array and set the label
        let person = items![indexPath.row]
        
        cell.textLabel?.text = person.name
        return cell
    }
}
