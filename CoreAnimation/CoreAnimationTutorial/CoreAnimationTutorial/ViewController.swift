import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var aView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func reset() {
        self.aView.transform = .identity
    }

    @IBAction func scale2D(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            // 가로, 세로의 크기를 1.5배로 증가
            let transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.aView.transform = transform
        } completion: { _ in
            self.reset()
        }
    }
    
    @IBAction func translation2D(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            // x, y 의 위치를 50씩 증가
            let transform = CGAffineTransform(translationX: 50, y: 50)
            self.aView.transform = transform
        } completion: { _ in
            self.reset()
        }
    }
    
    @IBAction func rotation2D(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            // 90도 회전
            let transform = CGAffineTransform(rotationAngle: .pi / 2)
            self.aView.transform = transform
        } completion: { _ in
            self.reset()
        }
    }
    
    @IBAction func chaining2D(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            // 90도 회전하고
            var transform = CGAffineTransform(rotationAngle: .pi / 2)
            // 가로, 세로의 크기를 1.5배로 증가하고
            transform = transform.scaledBy(x: 1.5, y: 1.5)
            // x, y 의 위치를 50씩 증가
            transform = transform.translatedBy(x: 50, y: 50)
            self.aView.transform = transform
        } completion: { _ in
            self.reset()
        }
    }
    
    @IBAction func scale3D(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            // x, y, z 의 크기를 1.5배로 증가
            let transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
            self.aView.transform3D = transform
        } completion: { _ in
            self.reset()
        }
    }
    
    @IBAction func translation3D(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            // x, y, z 의 위치를 50씩 증가
            let transform = CATransform3DMakeTranslation(50, 50, 50)
            self.aView.transform3D = transform
        } completion: { _ in
            self.reset()
        }
    }
    
    @IBAction func rotationX3D(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            // x축으로 180도 회전
            let transform = CATransform3DMakeRotation(.pi, 1, 0, 0)
            self.aView.transform3D = transform
        } completion: { _ in
            self.reset()
        }
    }
    
    @IBAction func rotationY3D(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            // y축으로 180도 회전
            let transform = CATransform3DMakeRotation(.pi, 0, 1, 0)
            self.aView.transform3D = transform
        } completion: { _ in
            self.reset()
        }
    }
    
    @IBAction func rotationZ3D(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            // z축으로 180도 회전
            let transform = CATransform3DMakeRotation(.pi, 0, 0, 1)
            self.aView.transform3D = transform
        } completion: { _ in
            self.reset()
        }
    }
    
    @IBAction func chaining3D(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            // x, y, z 의 크기를 1.5배로 증가
            var transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
            // x, y, z 의 위치를 50씩 증가
            transform = CATransform3DTranslate(transform, 50, 50, 50)
            // x축으로 180도 회전
            transform = CATransform3DRotate(transform, .pi, 1, 0, 0)
            self.aView.transform3D = transform
        } completion: { _ in
            self.reset()
        }
    }
}

