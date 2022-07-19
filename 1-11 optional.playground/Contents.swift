import UIKit

//옵셔널
//값이 있을 수도, 없을 수도 있음을 표현 (nil 할당 가능 여부)
//nil의 가능성 명시 -> 예외 상황에 대해 안전한 코딩

//nil 할당 가능
func someFunction(someOptionalParam: Int?){
    
}

//nil 할당 불가능
func someFunction(someParam: Int){
    
}

someFunction(someOptionalParam: nil)
//someFunction(someParam: nil) 컴파일 오류 발생

//옵셔널 문법, 선언
//enum Optional<Wrapped>: ExpressibleByNiliteral {
//         case none
//         case some(Wrapped)
//}
//
//let optionalValue: Optional<Int>? = nil
//let optionalValue: Int? = nil

//옵셔널 표현 : ? !
//! 압시적 추출 옵셔널 - 기존 변수 처럼 사용 가능, 잘못된 접근으로 런타임 오류 발생 가능
//switch문 이용
var implicityUnwrappedOptionalValue: Int!=100

switch implicityUnwrappedOptionalValue{
case.none:
    print("This optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}
implicityUnwrappedOptionalValue=implicityUnwrappedOptionalValue+1

implicityUnwrappedOptionalValue=nil

//implicityUnwrappedOptionalValue=implicityUnwrappedOptionalValue+1  //런타임 에러 발생 -> 잘못된 접근, nil은 연산 불가!

//? 일반적인 옵셔널 - 기존 변수 처럼 사용 불가, 연산 불가

var optionalValue: Int? = 100

switch optionalValue{
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

//optionalValue=optionalValue+1  //기존 변수처럼 사용 불가, 옵셔널과 일반 타입은 다른 타입 -> 연산 불가

optionalValue=nil
