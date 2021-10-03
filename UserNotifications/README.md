## User Notifications

---

`User Notofications`은 서버에서 알림을 푸시하거나 로컬 기기 자체 앱에서 생성하여 사용자에게 알림을 처리하기 위해 iOS 10부터 도입된 사용자 알림 프레임워크입니다. 이전에는 UILocalNotification, Remote Notification과 같이 로컬과 원격 알림이 분리되어 있었지만 User Notifications로 통합되었습니다.

사용자 알림은 앱이 사용자의 기기에서 실행 중인지, 포그라운드, 백그라운드 여부와 관계없이 중요한 정보를 사용자에게 전달합니다.

다음과 같은 알림을 생성하여 사용자에게 알려줄 수 있습니다.

-   새 메시지가 오면 사용자에게 알려줍니다.
-   등록한 일정에 대한 알림을 사용자에게 알려줍니다.
-   알림은 또한 앱에 정보를 다운로드하고 해당 인터페이스를 업데이트하도록 할 수 있습니다.

알림을 표시할 때에는 알림창을 표시하거나, 소리를 재생하거나, 앱 아이콘에 배지를 달아서 표시할 수 있습니다.

다음과 같이 사용할 수 있습니다.

-   앱에서 지원하는 알림 타입을 정의합니다.
-   알림 타입과 관련된 사용자 커스텀 작업을 정의합니다.
-   전달을 위한 로컬 알림을 스케줄합니다.
-   이미 전달된 알림을 처리합니다.
-   사용자가 선택한 작업에 응답합니다.

모든 로컬 및 원격 알림을 최적의 시기에 전달하려고 하지만 이 전달성이 보장되지는 않습니다. `PushKit` 프레임워크는 VoIP와 watchOS complication에서 사용되는 알림과 같이 특정 유형에 대한 알림을 보다 적절한 전달 메커니즘을 제공합니다. 자세한 내용은 PushKit 프레임워크에서 확인할 수 있습니다.

FCM

---

### 참고 URL

>    [Apple User Notifications](https://developer.apple.com/documentation/usernotifications)
>
>   [Local and Remote Notification Programming Guide](https://developer.apple.com/library/archive/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/index.html#//apple_ref/doc/uid/TP40008194-CH3-SW1)
>
>   [Push Notifications Tutorial for iOS: Rich Push Notifications](https://www.raywenderlich.com/8277640-push-notifications-tutorial-for-ios-rich-push-notifications)

