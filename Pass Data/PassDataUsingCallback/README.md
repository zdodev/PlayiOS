## Callback을 사용하여 ViewController와 Model간의 데이터 전달

- Model 정의.
  - 메서드 정의.
  - 전달할 데이터를 인자로 받는 클로저 형태의 매개변수 메서드 생성.
  - 클로저 매개변수 실행
- ViewController 정의.
  - 모델 인스턴스 생성
  - 모델의 메서드 호출
  - 클로저 전달 시 Model의 데이터를 참조할 수 있는 프로퍼티나 메서드 전달(여기서는 useData(data) 메서드)

