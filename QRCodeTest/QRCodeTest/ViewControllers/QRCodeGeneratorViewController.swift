import UIKit

final class QRCodeGeneratorViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var qrCodeView: QRCodeView!
    
    private let viewModel = QRCodeGeneratorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        viewModel.startTimer()
    }
    
    private func bind() {
        viewModel.timer.bind { [weak self] time in
            self?.timerLabel.text = time
        }
        viewModel.qrCodeData.bind { [weak self] data in
            self?.qrCodeView.generateCode(data)
        }
    }
}
