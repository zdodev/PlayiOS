# Reactive Programming

## 동기와 비동기

보통의 코드는 동기로 동작하지만 비동기로 처리하기 위해서 `DispatchQueue`의 Async를 사용할 수 있다.

> Observable 만들기
>
> Operators
>
> Subject
>
> Scheduler
>
> Single

## RxSwift를 사용하는 이유?

비동기적인 작업의 코드를 조금 더 간결하게 사용하고 싶을 때

## Scheduler

스트림(operator)을 실행시킬 스케줄러를 결정합니다.

- observe(on:) - 이후 operator를 해당 스케줄러에서 실행시킵니다.
- subscribe(on:) - 초기 실행 스케줄러를 결정합니다.

## Subject

데이터를 가지고 있을 수도, 데이터를 입력해 줄 수도 있는 요소입니다.