import Foundation

struct HostStreamConnection: StreamConnection {
    private let serverAddress: CFString
    private let serverPort: UInt32
    private let inputStream: InputStream!
    private let outputStream: OutputStream!
    
    init(address: String, port: UInt32) {
        serverAddress = address as CFString
        serverPort = port
        
        var readStream: Unmanaged<CFReadStream>!
        var writeStream: Unmanaged<CFWriteStream>!
        
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, serverAddress, serverPort, &readStream, &writeStream)
        
        inputStream = readStream.takeRetainedValue()
        outputStream = writeStream.takeRetainedValue()
    }
    
    func inputStreamConnection() -> InputStream {
        inputStream.schedule(in: .current, forMode: .common)
        
        return inputStream
    }

    func outputStreamConnection() -> OutputStream {
        outputStream.schedule(in: .current, forMode: .common)
        
        return outputStream
    }
}
