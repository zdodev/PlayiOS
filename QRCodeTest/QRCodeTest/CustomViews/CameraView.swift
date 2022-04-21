import UIKit
import AVFoundation

final class CameraView: UIView {
    private let captureSession = AVCaptureSession()
    private let videoLayer: AVCaptureVideoPreviewLayer
    private let output = AVCaptureMetadataOutput()
    private var currentCameraPosition = AVCaptureDevice.Position.back
    
    private var backCameraPositionDeviceInput: AVCaptureDeviceInput?
    private var frontCameraPositionDeviceInput: AVCaptureDeviceInput?
    
    override init(frame: CGRect) {
        videoLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        super.init(frame: frame)
        
        setup()
    }
        
    required init?(coder: NSCoder) {
        videoLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        super.init(coder: coder)
        
        setup()
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)

        videoLayer.frame = layer.bounds
    }
    
    func setDelegate(_ avCaptureMetadataOutputObjectsDelegate: AVCaptureMetadataOutputObjectsDelegate) {
        output.setMetadataObjectsDelegate(avCaptureMetadataOutputObjectsDelegate, queue: .main)
    }
    
    func switchCamera() {
        if currentCameraPosition == .back {
            currentCameraPosition = .front
        } else {
            currentCameraPosition = .back
        }
        
        setupDeviceInput(position: currentCameraPosition)
    }
    
    func stopCapture() {
        captureSession.stopRunning()
    }
    
    private func setup() {
        setVideoLayer()
        
        guard let backCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            return
        }
        guard let frontCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else {
            return
        }
        
        backCameraPositionDeviceInput = try? AVCaptureDeviceInput(device: backCaptureDevice)
        frontCameraPositionDeviceInput = try? AVCaptureDeviceInput(device: frontCaptureDevice)
        
        setupDeviceInput(position: .back)
        setupDeviceOutput()
        
        captureSession.startRunning()
    }
    
    private func setupDeviceInput(position: AVCaptureDevice.Position) {
        guard let frontCameraPositionDeviceInput = frontCameraPositionDeviceInput else {
            return
        }
        guard let backCameraPositionDeviceInput = backCameraPositionDeviceInput else {
            return
        }
        
        captureSession.beginConfiguration()
        switch position {
        case .back:
            captureSession.removeInput(frontCameraPositionDeviceInput)
            captureSession.addInput(backCameraPositionDeviceInput)
        case .front:
            captureSession.removeInput(backCameraPositionDeviceInput)
            captureSession.addInput(frontCameraPositionDeviceInput)
        default:
            print("error")
        }
        captureSession.commitConfiguration()
    }
    
    private func setupDeviceOutput() {
        captureSession.addOutput(output)
        output.metadataObjectTypes = [.qr]
    }

    private func setVideoLayer() {
        videoLayer.frame = layer.bounds
        videoLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(videoLayer)
    }
}
