import Foundation

protocol DelegateProxyType {
    associatedtype Object
    
    func setDelegate(to object: Object)
}

fileprivate var associatedKey = Int()

extension DelegateProxyType where Self: DelegateProxy {
    static func createDelegateProxy(for object: Object) -> Self {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        
        let delegateProxy: Self
        
        if let associatedObject = objc_getAssociatedObject(
            object,
            &associatedKey
        ) as? Self {
            delegateProxy = associatedObject
        } else {
            delegateProxy = .init()
            objc_setAssociatedObject(
                object,
                &associatedKey,
                delegateProxy,
                .OBJC_ASSOCIATION_RETAIN
            )
        }
        
        delegateProxy.setDelegate(to: object)
        
        return delegateProxy
    }
}
