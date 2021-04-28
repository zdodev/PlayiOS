import Foundation

protocol MessageEventDelegate: AnyObject {
    func readMessage(stream: InputStream)
}

// An interface that delegates of a stream instance use to handle events on the stream.
final class StreamEventHandler: NSObject, StreamDelegate {
    weak var delegate: MessageEventDelegate?
    // The delegate receives this message when a given event has occurred on a given stream.
    func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
        switch eventCode {
        // The stream has bytes to be read.
        case .hasBytesAvailable:
            if let inputStream = aStream as? InputStream {
                delegate?.readMessage(stream: inputStream)
            }
        default:
            print("다른 스트림 이벤트 발생")
        }
    }
}
