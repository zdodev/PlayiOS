import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var flipView: FlipView!
    
    let frontView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    let rearView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flipView.setFlipViews(frontView: frontView, rearView: rearView)
    }
    
    @IBAction func tappedFlipButton(_ sender: UIButton) {
        flipView.flip()
    }
}

