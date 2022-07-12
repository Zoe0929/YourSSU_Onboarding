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

## 1-4 기본 데이터 타입

### Swift의 기본 데이터 타입

- Bool
- Int, UInt
- Float, Double
- Character, String

### Bool

true, false 값을 가지는 타입 

```swift
var someBool: Bool = true
someBool = false
// someBool = 0 // 컴파일 오류발생
// someBool = 1 // 컴파일 오류발생
```

### 정수 타입 - Int, Uint

**Int**: 정수 타입, 64비트 정수형

**Uint** : 양의 정수, 64비트 양의 정수

```swift
// Int
var someInt: Int = -100
// someInt = 100.1 // 컴파일 오류발생

//UInt
var someUInt: UInt = 100
// someUInt = -100 // 컴파일 오류발생
// someUInt = someInt // 컴파일 오류발생
```

### 실수 타입 - Float, Double

**Float** : 실수 타입. 32비트 부동소수형.

**Double :** 실수 타입. 64비트 부동소수형.

```swift
// Float
var someFloat: Float = 3.14
someFloat = 3

// Double
var someDouble: Double = 3.14
someDouble = 3
// someDouble = someFloat // 컴파일 오류발생
```

### 문자 - Character, String

**Character** : 문자 타입. 유니코드 사용. 큰따옴표("") 사용.

**String** : 문자열 타입. 유니코드 사용. 큰따옴표("") 사용.

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

## 1-6 컬렉션 타입

[콜렉션 타입 (Collection Types)](https://bbiguduk.gitbook.io/swift/language-guide-1/collection-types)

### Array

멤버가 ***순서를 가진(인덱스 이용 가능)*** 리스트 형태의 컬렉션 타입

```jsx
var integers: Array<Int> = Array<Int>()
//var Array명 : Array<타입> = Array<타입>()
```

- 다양한 표현법 : 여러가지 리터럴 문법 활용 가능
    - `Array<Element>`을 짧게 `[Element]`로도 표현 가능

```swift
var integers: Array<Int> = [Int]()
var integers: Array<Int> = []
var integers: [Int] = Array<Int>()
var integers: [Int] = [Int]()
var integers: [Int] = []
var integers = [Int]()
```

- Array의 활용

### Dictionary

***키와 값***으로 이뤄진 컬렉션 타입 

### Set

***중복되지 않는*** 멤버가 ***순서없이*** 존재하는 컬렉션

- Array, Dictionary와 다르게 축약형이 존재하지 않음
