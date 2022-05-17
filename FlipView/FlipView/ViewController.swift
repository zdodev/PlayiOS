import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var flipView: UIView!
    @IBOutlet weak var rearView: UIView!
    
    private var flipped = false
    
    @IBAction func tappedFlipButton(_ sender: UIButton) {
        if flipped {
            UIView.transition(from: flipView, to: rearView, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews])
            flipped = false
        } else {
            UIView.transition(from: rearView, to: flipView, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews])
            flipped = true
        }
    }
}

