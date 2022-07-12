import UIKit

var greeting = "Hello, playground"

//변수와 상수
var a = 3;
let b = 3;

a = 4;
//b = 6; let으로 선언된 상수는 변경 불가


//1-5. Any, AnyObject, nil

//1. Any : Swift의 모든 타입을 지칭하는 키워드

var someAny: Any = 100
someAny="어떤 타입도 수용 가능"
someAny=123.12

//let someDouble: Double=someAny 컴파일 오류 발생
//Any 타입에 Double 자료를 넣어 두었더라도, Any != Double 이므로 할당 불가 -> 명시적 타입변환 필요.

//2. AnyObject: 모든 클래스 타입을 지칭하는 프로토콜
class SomeClass{}
var SomeAnyObject:AnyObject=SomeClass()

//SomeAnyObject=123.12 컴파일오류, AnyObject는 클래스의 인스턴스만 수용 가능. Double 타입은 할당 불가.

//3. nil : null과 같은 뜻, 없다는 걸 의미한다.

//someAny=nil 컴파일 오류
//SomeAnyObject=nil 컴파일 오류


