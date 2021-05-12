## Stack View

스택 뷰로 레이아웃을 구성해보았습니다.

<img src="Image/sample2.png" width="300" height="600"> <img src="Image/sample3.png" width="600" height="300">

스택 뷰는 가로 또는 세로로 뷰를 배치할 수 있는 컨테이너 뷰입니다.

스택 뷰는 오토 레이아웃의 기능을 활용하여 장치의 방향, 화면 크기, 사용 가능한 공간의 모든 변경 사항을 동적으로 관리할 수 있는 기능을 제공합니다. 스택 뷰는 자신의 `arrangedSubviews` 프로퍼티에 있는 모든 뷰의 레이아웃을 관리합니다. 스택 뷰는 자신의 축과 `arrangedSubviews` 배열의 순서에 따라 뷰를 정렬합니다. 스택 뷰의 레이아웃은 axis, distribution, alignment, spacing에 따라 달라집니다.

스택 뷰는 오토 레이아웃을 사용하여 정렬된 뷰의 위치와 크기를 정합니다. 스택 뷰는 배열된 첫 번째 뷰와 마지막 뷰를 스택의 축을 따라 가장자리에 나란히 정렬합니다.

- Axis: 스택 뷰의 축 설정
- Alignment = 스택 뷰와 요소 간의 화면 정렬 설정
- Distribution = 뷰 요소 간의 화면 비율 설정
- Spacing = 뷰 요소 간의 공백 설정

