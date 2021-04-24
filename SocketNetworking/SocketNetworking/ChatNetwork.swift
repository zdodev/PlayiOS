import Foundation

final class ChatNetwork: NSObject {
    // A stream that provides read-only stream functionality.
    private var inputStream: InputStream!
    // A stream that provides write-only stream functionality.
    private var outputStream: OutputStream!
    private let username = "3pro"
    private let maxMessageLength = 300
    
    func setupNetwork() {
        // A type for propagating an unmanaged object reference.
        // A reference to a readable stream object.
        var readStream: Unmanaged<CFReadStream>?
        // A reference to a writable stream object.
        var writeStream: Unmanaged<CFWriteStream>?
        
        // Creates readable and writable streams connected to a TCP/IP port of a particular host.
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, "localhost" as CFString, 80, &readStream, &writeStream)
        
        // Gets the value of this unmanaged reference as a managed reference and consumes an unbalanced retain of it.
        inputStream = readStream?.takeRetainedValue()
        outputStream = writeStream?.takeRetainedValue()
        
        // Schedules the receiver on a given run loop in a given mode.
        inputStream.schedule(in: .current, forMode: .common)
        outputStream.schedule(in: .current, forMode: .common)
        
        inputStream.delegate = self
        
        // Opens the receiving stream.
        inputStream.open()
        outputStream.open()
    }
    
    func connectChat() {
        // 연결 메시지 생성
        let joinMessage = "iam:\(username)".data(using: .utf8)!
    
        joinMessage.withUnsafeBytes { (unsafeRawBufferPointer) in
            // UnsafeRawBufferPointer -> UnsafeRawPointer -> UnsafePointer<T>
            guard let message = unsafeRawBufferPointer.baseAddress?.assumingMemoryBound(to: UInt8.self) else {
                print("채팅 연결 실패")
                return
            }
            
            // Writes the contents of a provided data buffer to the receiver.
            let result = outputStream.write(message, maxLength: joinMessage.count)
            if result > 0 {
                print("연결 메시지 전송 성공")
            } else {
                print("연결 메시지 전송 실패")
            }
        }
    }
    
    private func readMessage(stream: InputStream) {
        // UnsafeMutablePointer<UInt8>
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: maxMessageLength)
        
        // Reads up to a given number of bytes into a given buffer.
        let readBytes = inputStream.read(buffer, maxLength: maxMessageLength)
        
        // Produces an initialized String object that contains a given number of bytes from a given buffer of bytes interpreted in a given encoding, and optionally frees the buffer.
        // WARNING: this initializer is not memory-safe!
        guard let messages = String(bytesNoCopy: buffer, length: readBytes, encoding: .utf8, freeWhenDone: true) else {
            return
        }
        
        print(messages)
    }
}

// An interface that delegates of a stream instance use to handle events on the stream.
extension ChatNetwork: StreamDelegate {
    // The delegate receives this message when a given event has occurred on a given stream.
    func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
        switch eventCode {
        // The stream has bytes to be read.
        case .hasBytesAvailable:
            readMessage(stream: aStream as! InputStream)
        default:
            print("다른 스트림 이벤트 발생")
        }
    }
}
