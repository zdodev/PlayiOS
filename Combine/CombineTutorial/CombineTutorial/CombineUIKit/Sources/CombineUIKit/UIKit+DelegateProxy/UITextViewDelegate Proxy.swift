import UIKit

extension UIScrollViewDelegateProxy: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        _ = subscribers[.textViewDidBeginEditing]?.receive([textView])
    }
}
