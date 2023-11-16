import Foundation

public struct CombineReactive<Base> {
    let base: Base

    public init(_ base: Base) {
        self.base = base
    }
}

public protocol CombineCompatible {
    
}

public extension CombineCompatible {
    var combine: CombineReactive<Self> {
        get {
            CombineReactive(self)
        }
    }
}

extension NSObject: CombineCompatible { }
