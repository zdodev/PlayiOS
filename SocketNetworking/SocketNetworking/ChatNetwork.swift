import Foundation

protocol StreamConnection {
    init(address: String, port: UInt32)
    func inputStreamConnection() -> InputStream
    func outputStreamConnection() -> OutputStream
}

final class ChatNetwork {
    // A stream that provides read-only stream functionality.
    private var inputStream: InputStream!
    // A stream that provides write-only stream functionality.
    private var outputStream: OutputStream!
    private var username = ""
    private let maxMessageLength = 300
    private let streamDelegate = StreamEventHandler()
    
    init(username: String) {
        self.username = username
        
        let streamConnection: StreamConnection = HostStreamConnection(address: "localhost", port: 80)
        
        inputStream = streamConnection.inputStreamConnection()
        outputStream = streamConnection.outputStreamConnection()
        
        streamDelegate.delegate = self
        inputStream.delegate = streamDelegate
        
        // Opens the receiving stream.
        inputStream.open()
        outputStream.open()
    }
    
    func connectChat(completionHandler: (Result<Int, NetworkError>) -> Void) {
        // 연결 메시지 생성
        let chatConnectionMessage = ChatConnectionMessage()
        let joinMessage = chatConnectionMessage.createJoinMessageFormat(username: username)
    
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
                completionHandler(.success(result))
            } else {
                print("연결 메시지 전송 실패")
                completionHandler(.failure(.connectionFail))
            }
        }
    }
}

extension ChatNetwork: MessageEventDelegate {
    func readMessage(stream: InputStream) {
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
