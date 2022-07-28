import UIKit

//클로저 - 실행 가능한 코드 블럭
//이름 정의 X, 매개변수 전달과 반환 값 존재 가능
//일급 객체 -> 전달인자, 변수, 상수 등에 저장 및 전달 가능

//클로저 정의 부분
let add:(Int,Int)->Int = {(a:Int,b:Int)->Int in
    return a+b
}

let substract: (Int, Int) -> Int
substract = { (a: Int, b: Int) in
    return a - b
}

let divide: (Int, Int) -> Int
divide = { (a: Int, b: Int) in
    return a / b
}

//함수 정의
func calculate(a:Int, b:Int, method: (Int, Int)->Int)->Int{
    return method(a,b)
}

var calculated: Int

calculated=calculate(a: 50, b: 10, method: add)
print(calculated)

// 클로저를 상수, 변수에 넣지 않고 매개변수로 바로 적용한 예제
calculated = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in
    return left * right
})
print(calculated)
