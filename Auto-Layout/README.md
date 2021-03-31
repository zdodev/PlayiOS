# Auto Layout

### auto layout의 핵심 요소

Auto layout은 뷰 요소의 위치 좌표(x, y)와 크기(width, height)가 정해져야 auto layout을 지정할 수 있습니다.

- x
- y
- width(horizontal)
- height(vertical)

### UI를 스토리보드가 아닌 코드로 UI를 작성하고 auto layout을 설정하는 이유는?

스토리보드의 경우 협업 시 코드 충돌이 빈번하게 발생하고, 충돌을 해결하기 쉽지 않기 때문에 뷰의 위치와 크기를 명시적으로 작성한 코드를 통해 작성하는 경우가 많습니다.

### Self sizing

컴포넌트의 콘텐츠에 맞춰 크기가 가변적인 뷰를 만드는 방법입니다. 뷰의 높이와 너비를 콘텐츠에 의존하도록 제약 조건을 줄 경우 가변적인 뷰를 만들 수 있습니다.

### Dynamic Table View

셀의 구성요소와 그 콘텐츠에 맞춰 크기가 가변적인 테이블 뷰를 구성하는 방법입니다.

-   높이와 너비를 맞춰서 셀을 구성합니다.
-   테이블뷰에서 가변적인 높이를 적용할 수 있도록 설정합니다.

```swift
myTableView.rowHeight = UITableView.automaticDimension
myTableView.estimatedRowHeight = 120
```

### 뷰 3등분하기

3개의 뷰 생성를 생성하여 상위 뷰(view)의 width를 삼등분하여 각 뷰의 x에 대입한 후 높이는 상위 뷰의 높이를 그대로 대입했다. 너비도 마찬가지로 상위 뷰의 너비를 삼등분하여 각 뷰의 너비에 대입했다.



<img width="301" alt="1" src="https://user-images.githubusercontent.com/67548251/113147139-6e066180-926b-11eb-842b-386028eabe53.png">

다음 주제는 auto layout을 설정하는 클래스 살펴보기.

## 참고 URL

---

>   [Apple Auto Layout Guide](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/index.html#//apple_ref/doc/uid/TP40010853-CH7-SW1)