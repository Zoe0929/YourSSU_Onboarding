import UIKit

//1. 함수 선언의 기초

// sum이라는 이름을 가지고
// a와 b라는 Int 타입의 매개변수를 가지며
// Int 타입의 값을 반환하는 함수
func sum(a: Int, b: Int) -> Int {
    return a + b
}

//2. 반환값이 없는 함수
func printMyName(name: String) -> Void {
    print(name)
}

// 반환 값이 없는 경우, 반환 타입(Void) 생략
func printYourName(name: String) {
    print(name)
}


//3. 매개변수가 없는 함수
func maximumIntegerValue() -> Int {
    return Int.max
}


//4. 매개변수와 반환값이 없는 함수
func hello() -> Void { print("hello") }


func bye() { print("bye") }
