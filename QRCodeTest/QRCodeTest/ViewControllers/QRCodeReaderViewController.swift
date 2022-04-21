import UIKit
import AVFoundation

final class QRCodeReaderViewController: UIViewController {
    @IBOutlet weak var cameraView: CameraView!
    
    private let viewModel = QRCodeReaderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        bind()
    }
    
    private func configureViews() {
        cameraView.setDelegate(viewModel)
    }
    
    private func bind() {
        viewModel.country.bind { [weak self] country in
            let countryString = country.name + country.code
            let alertViewController = UIAlertController.alertController("QR 메시지 수신", countryString, "확인")
            if !countryString.isEmpty {
                self?.present(alertViewController, animated: true)
                self?.vibrate()
                self?.cameraView.stopCapture()
            }
        }
    }
    
    @IBAction func tappedCameraSwitchingButton(_ sender: UIButton) {
        cameraView.switchCamera()
    }
    
    private func vibrate() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
}
