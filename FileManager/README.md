## 파일 시스템(File System)

파일 시스템은 파일과 폴더를 생성, 읽기, 쓰기, 검사에 대한 기능을 제공합니다.

실제 모바일 기기에서 실행한 결과입니다. macOS와 시뮬레이터에서는 결과값이 다릅니다.

```swift
let fileSystem = FileManager.default

print("NSUserName: \(NSUserName())")
// mobile

print("NSFullUserName: \(NSFullUserName())")
// Mobile User

print("temporaryDirecty: \(fileSystem.temporaryDirectory)")
// file:///private/var/mobile/Containers/Data/Application/D2DC8D5B-66AB-4FEA-835E-43BDA2BD443B/tmp/

print("NSTemporaryDirectory: \(NSTemporaryDirectory())")
// /private/var/mobile/Containers/Data/Application/D2DC8D5B-66AB-4FEA-835E-43BDA2BD443B/tmp/

let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
print(path)
// ["/var/mobile/Containers/Data/Application/D2DC8D5B-66AB-4FEA-835E-43BDA2BD443B/Library/Caches"]
```

❗️FileManager 에는 macOS에서만 사용할 수 있는 메서드가 있으니 Availability를 잘 보고 사용해야 합니다.

파일 생성

파일 삭제

디렉터리 조회

### 참고 링크

---

> [📖 Apple File System](https://developer.apple.com/documentation/foundation/file_system)
>
> [📖 Apple About Apple File System](https://developer.apple.com/documentation/foundation/file_system/about_apple_file_system)
>
> [📖 Apple File System Error Codes](https://developer.apple.com/documentation/foundation/file_system/file_system_error_codes)
>
> [📖 Developer Forums Apple Error](https://developer.apple.com/forums/thread/102116)