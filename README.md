# Pt.1 Swift 기초
## 1-2 명명법, 콘솔로그, 문자열 보간법

### 문자열 보간

`\(  )` 을 이용 : 문자열 내에 상수나 변수 같은 실질적인 값을 넣기 위해 사용함. 

### 콘솔로그

`print( )` : 문자열 콘솔에 출력

`dump( )` :인스턴스의 자세한 설명(description 프로퍼티)까지 출력

## 1-3 상수와 변수

### 상수, 변수 선언

`let` : 상수 선언 키워드

`var` : 변수 선언 키워드



## 1-5 범용 타입 ( Any, AnyObject) , nil

### Any

Swift의 모든 타입을 지칭하는 키워드

```swift
var someAny: Any = 100
someAny="어떤 타입도 수용 가능"
someAny=123.12
//let someDouble: Double=someAny 컴파일 오류 발생
```

- Any 타입에 Double 자료를 넣어 두었더라도, Any != Double 이므로 할당 불가 -> 명시적 타입변환 필요

### AnyObject

모든 클래스 타입을 지칭하는 프로토콜

```swift
class SomeClass{}
var SomeAnyObject:AnyObject=SomeClass()

//SomeAnyObject=123.12 컴파일오류
```

- AnyObject는 클래스의 인스턴스만 수용 가능. Double 타입은 할당 불가.

### nil

‘값이 없다’를 의미, Null, null과 같은 의미
