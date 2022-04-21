import Foundation

final class QRCodeGeneratorViewModel {
    let timer = Binder("3")
    let qrCodeData = Binder(Data())
    
    func startTimer() {
        createQRCodeData()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(decreaseTime), userInfo: nil, repeats: true)
    }
    
    @objc private func decreaseTime() {
        guard var time = Int(timer.value) else {
            return
        }
        
        if time == .zero {
            time = 4
            createQRCodeData()
        }
        
        timer.value = String(time - 1)
    }
    
    private func createQRCodeData() {
        let country = Country(name: "kr", code: "+82", date: Date())
        guard let encodedData = try? JSONEncoder().encode(country) else {
            return
        }

        qrCodeData.value = encodedData
    }
}
