import FirebaseAnalytics

struct AnalyticsService {
    enum AnalyticsEvent {
        case tappedButton(AnalyticsTappedEvent)
        
        var eventName: String {
            switch self {
            case .tappedButton:
                return "tappedButton"
            }
        }
    }
    
    private init() {}
    
    static let shared = AnalyticsService()
    
    static func logEvent(_ event: AnalyticsEvent) {
        switch event {
        case .tappedButton(let analyticsTappedEvent):
            Analytics.logEvent(
                event.eventName,
                parameters: analyticsTappedEvent.dictionary
            )
        }
    }
}

struct AnalyticsTappedEvent: Encodable {
    let name: String
}

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        guard let _dictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return nil
        }
        return _dictionary
    }
}
