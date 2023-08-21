import UIKit

final class ViewController: UIViewController {
    private let repository: PlaceholderRepositoryProtocol
    
    init(repository: PlaceholderRepositoryProtocol) {
        self.repository = repository
        
        super.init(
            nibName: nil,
            bundle: nil
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        Task {
            do {
                try await fetch()
            } catch {
                print(error)
            }
        }
    }
    
    func fetch() async throws {
        let post = try await repository.requestPosts()
    }
}
