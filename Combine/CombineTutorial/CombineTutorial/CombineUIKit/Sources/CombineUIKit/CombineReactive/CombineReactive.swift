import UIKit

public struct CombineReactive<Base> {
    let base: Base

    public init(_ base: Base) {
        self.base = base
    }
}

public protocol CombineCompatible {
    
}

public extension CombineCompatible {
    var publisher: CombineReactive<Self> {
        get {
            CombineReactive(self)
        }
    }
}


final class ScrollViewDelegate: NSObject, UIScrollViewDelegate {
    init(_ scrollView: UIScrollView) {
        super.init()
        
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
