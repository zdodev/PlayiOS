# Core Data

- 디바이스에서 데이터를 유지, 캐시하고 데이터를 되돌리는 기능을 지원합니다.

## 개요

- 애플리케이션의 영구 데이터를 오프라인에서도 사용할 수 있도록 저장하고, 임시 데이터를 캐시하고 데이터를 되돌리는 기능을 제공합니다.
- 코어 데이터의 모델 에디터를 통해 데이터의 타입과 관계를 정의하고 각 클래스 정의를 생성할 수 있습니다.
- 코어 데이터는 실행시간에 개체 인스턴스를 관리하고 다음과 같은 기능을 제공할 수 있습니다.

## 영속성

- 코어 데이터는 객체를 저장소에 매핑하는 세부 정보를 추상화하므로 데이터베이스를 직접 관리하지 않고도 Swift와 Objective-C의 데이터를 쉽게 저장할 수 있습니다.

## 개별 및 일괄 변경사항을 되돌리거나 재실행
- 코어 데이터는 변경 내용을 추적하여 개별 또는 그룹으로 한꺼번에 롤백할 수 있으므로 되돌리거나 재실행 기능을 쉽게 추가할 수 있습니다.

## 백그라운드 데이터 태스크
- JSON 데이터 파싱 작업과 같은 UI 블록 작업을 백그라운드에서 수행합니다. 그런 다음 결과를 캐시하거나 저장하여 서버 재요청을 줄일 수 있습니다.

## 뷰 동기화
- 코어 데이터는 뷰와 데이터 동기화를 지원합니다.

## Versiong and Migration
- 코어 데이터는 앱이 발전함에 따라 데이터 모델을 버전화하고 사용자 데이터를 마이그레이션하는 메커니즘이 포함되어 있습니다.

## 참고 URL

### Apple Core Data
https://developer.apple.com/documentation/coredata

### Core Data Programming Guide

https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/KeyConcepts.html

### Core Data Model 만들기

https://developer.apple.com/documentation/coredata/creating_a_core_data_model

### Core Data 스택 설정

https://developer.apple.com/documentation/coredata/setting_up_a_core_data_stack

### Core Data Programming Guide
https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/