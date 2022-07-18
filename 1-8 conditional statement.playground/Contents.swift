import UIKit

//swift의 조건문
//if-else, switch,

//1. if else 조건을 감싸는 소괄호는 조건 사항.
//실행구문을 감싸는 {}은 생략 불가능 -> 한 줄이어도 꼭 작성해야함

let someinteger=100

if someinteger<100 {
    print("100미만")
}
else if someinteger>100{
    print("100초과")
}
else {
    print("100")
}

//2. switch
//swift의 switch문에서는 대부분의 스위프트 기본 타입 지원, 다양한 패턴과 응용 가능
//명시적으로 break 하지 않아도 break됨
//, 이용 여러가지 패턴 응용 가능?
switch someinteger{
case 0:
    print("zero")
case  1..<100:
    print("1~99")
case 100:
    print("100")
case 101...Int.max:
    print("over 100")
default:
    print("unknown")
}

