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
