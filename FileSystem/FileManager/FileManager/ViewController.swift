import UIKit

class ViewController: UIViewController {
    // 파일매니저
    let fileSystem = FileManager.default
    
    // 데이터
    let datas = [
        Data(base64Encoded: "test"),
        Data(base64Encoded: "test"),
        Data(base64Encoded: "test"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // document 경로 획득
        var url = fileSystem.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        print(url)
        
        // 파일 생성
        fileSystem.createFile(atPath: url.appendingPathComponent("data1").path, contents: datas[0])
        fileSystem.createFile(atPath: url.appendingPathComponent("data2").path, contents: datas[1])
        fileSystem.createFile(atPath: url.appendingPathComponent("data3").path, contents: datas[2])
        
        // 파일 확인
        try? print(fileSystem.contentsOfDirectory(atPath: url.path))
        
        // 파일 1개 삭제
        try? fileSystem.removeItem(at: url.appendingPathComponent("data3"))
        
        // 파일 확인
        try? print(fileSystem.contentsOfDirectory(atPath: url.path))
        
        let fileList = try? fileSystem.contentsOfDirectory(atPath: url.path)
        
        if let fileList = fileList {
            // 디렉터리 내 전체 파일 삭제
            fileList.forEach { filename in
                try? fileSystem.removeItem(at: url.appendingPathComponent(filename))
            }
        }
        
        // 삭제된 파일 확인
        try? print(fileSystem.contentsOfDirectory(atPath: url.path))
    }
}

