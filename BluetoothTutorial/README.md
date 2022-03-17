# Core Bluetooth

iOS 블루투스 프레임워크, Core Bluetooth

GATT(Generic Attribute Profile): 두 장치간에 Service, Characteristic 을 이용해서 데이터를 주고 받는 방법을 정의한 것.

ATT(Attribute Protocol): 서버와 클라이언트 사이의 데이터 교환에 대한 규칙을 정의한 것.

L2CAP(Logical Link Control and Adaption Protocol): 상위 레이어(GATT/GAP)와 하위레이어 사이의 상호작용을 담당한다.



데이터를 브로드캐스팅하는 것 -> Advertising

Advertising 하는 주체는 Peripheral이다.

Peripheral이 Advertising 하는 데이터를 스캔하여 읽는 주체는 Central이다.

Peripheral -> (advertising data) -> Central

advertise: 광고하다.

peripheral: 주변 장치

central: 중심의



통신방법

-   Advertise 모드
-   Connection 모드



CBCentral: Peripheral 역할을 하는 로컬 앱에 연결된 원격 장치입니다.

- Identifying a Remote Central

CBCentralManager: Peripheral을 스캔, 탐색, 연결 및 관리하는 개체입니다. Central 역할을 수행할 수 있도록 관리합니다.

- Initializing a Central Manager
- Establishing or Canceling Connections with Peripherals
- Retrieving Lists of Peripherals
- Scanning or Stopping Scans of Peripherals
- Inspecting Feature Support
- Monitoring Properties
- Receiving Connection Events

CBCentralManagerDelegate: Peripheral 장치의 검색 및 관리를 위한 업데이트를 제공합니다.

- Monitoring Connections with Peripherals
- Discovering and Retrieving Peripherals
- Monitoring the Central Manager's State
- Monitoring the Central Manager's Authorization

CBPeripheral: 원격 peripheral 장치입니다.

- Identifying a Peripheral
- Discovering Services
- Discovering Characteristics and Descriptors
- Reading Characteristic and Descriptor Values
- Writing Characteristic and Descriptor Values
- Setting Notifications for a Characteristic's Value
- Monitoring a Peripheral's Connection State
- Accessing a Peripheral's Signal Strength
- Working with L2CAP Channels
- Working with Apple Notification Center Service(ANCS)



Central 에서 Peripheral 데이터 읽기

-   cbPeripheral.readValue(), 데이터 읽기 요청
-   CBPeripheralManagerDelegate, 읽기 요청 시 호출되는 델리게이트 메서드
    -   peripheralManager(_:didReceiveRead:)

Central 에서 Peripheral 로 데이터 쓰기

-   cbPeripheral.writeValue(), 데이터 쓰기 요청
-   CBPeripheralManagerDelegate, 쓰기 요청 시 호출되는 델리게이트 메서드
    -   peripheralManager(_:didReceiveWrite:)

Peripheral 에서 Characteristic 데이터 업데이트

-   peripheralManager.updateValue(), Characteristic 데이터 업데이트


### 참고 링크

---

> [Apple Core Bluetooth](https://developer.apple.com/documentation/corebluetooth)
>
> [Apple Core bluetooth Programming Guide](https://developer.apple.com/library/archive/documentation/NetworkingInternetWeb/Conceptual/CoreBluetooth_concepts/AboutCoreBluetooth/Introduction.html#//apple_ref/doc/uid/TP40013257)
>
> [Estimator: BLE를 사용한 Planning Poker 애플리케이션](https://www.theteams.kr/teams/866/post/64575)
>
> [Core Bluetooth 가이드](https://leejigun.github.io/CoreBlutooth)
>
> [[iOS]Core Bluetooth 활용하기#01](https://staktree.github.io/ios/iOS-Bluetooth-01-about-CoreBluetooth/)
