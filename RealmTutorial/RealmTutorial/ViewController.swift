import UIKit
import RealmSwift

class ViewController: UIViewController {
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        render()
        realm.beginWrite()
        realm.delete(realm.objects(Person.self))
        try! realm.commitWrite()
//        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        save()
        render()
    }
    
    func render() {
        let people = realm.objects(Person.self)
        for person in people {
            let firstName = person.firstName
            let lastName = person.lastName
            let fullName = "\(firstName) \(lastName)"
            print("\(fullName)")
            
//            let label = UILabel(frame: view.bounds)
//            label.text = fullName
//            label.textAlignment = .center
//            label.numberOfLines = 0
//            view.addSubview(label)
//            label.font = UIFont(name: "Helvetica", size: 42)
        }
    }
    
    func save() {
        let joe = Person()
        joe.firstName = "Jenny"
        joe.lastName = "Johnson"
        
        let apa = Person()
        apa.firstName = "Apa"
        apa.lastName = "Pap"
        
        let beb = Person()
        beb.firstName = "Beb"
        beb.lastName = "Ebe"
        
        realm.beginWrite()
        realm.add(joe)
        realm.add(apa)
        realm.add(beb)
        try! realm.commitWrite()
    }
}

class Person: Object {
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var age = 0
    
}
