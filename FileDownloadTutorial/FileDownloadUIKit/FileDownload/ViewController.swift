import UIKit

final class ViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("download", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(imageView)
        view.addSubview(downloadButton)
        
        downloadButton.addTarget(self, action: #selector(tappedDownloadButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            downloadButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            downloadButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        ])
    }
    
    @objc private func tappedDownloadButton() {
        Task {
            await downloadImage()
        }
    }
    
    private func downloadImage() async {
        let url = URL(string: "https://placehold.co/600x400.png")!
        let urlRequest = URLRequest(url: url)
        
        let (downloadedURL, _) = try! await URLSession.shared.download(for: urlRequest)
        
        let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let destinationURL = documentURL.appendingPathComponent("image.png", conformingTo: .image)
        
        if !FileManager.default.fileExists(atPath: destinationURL.path(percentEncoded: false)) {
            try! FileManager.default.moveItem(at: downloadedURL, to: destinationURL)
        }
        
        imageView.image = .init(contentsOfFile: destinationURL.path(percentEncoded: false))
    }
}
