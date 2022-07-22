import UIKit

//클래스 : 참조(reference) 타입
//swift의 클래스는 다중 상속 불가

class Sample{
    //가변 프로퍼터
    var mutableProperty: Int=100
    //불변 프로퍼터
    let immutableProperty : Int = 100
    //타입 프로퍼터
    static var typeProperty: Int = 100
    //인스턴스 메서드
    func instanceMethod(){
        print("instance method")
    }
    //타입 메서드
    //상속시 재정의 불가
    static func typeMethod(){
        print("type method - static")
    }
    //상속시 재정의 가능
    class func classMethod(){
        print("type method - class")
        
    }
}

//인스턴스 생성, 참조정보 수정 가능
var mutableReference : Sample = Sample()
mutableReference.mutableProperty = 200
//불변 프로퍼터는 인스턴스 생성 후 수정 불가
//mutableReference.immutableProperty = 200 //컴파일 오류 발생

//인스턴스 생성, 참조 정보 수정 불가
let immutableReference : Sample = Sample()

//클래스의 인스턴스는 참조 타입 -> let으로 선언되어도 인스턴스 프로퍼터 값 변경 가능
immutableReference.mutableProperty = 200
//참조 정보는 변경 불가
//immutableReference = mutableReference //컴파일 오류 발생

//참조 타입이어도 불변 인스턴스는 수정 불가
//immutableReference.immutableProperty = 20 //컴파일 오류 발생

//타입 프로퍼터, 메서드 - 인스턴스 생성 없이도 사용 가능
Sample.typeProperty = 300
Sample.typeMethod()

//인스턴스에서는 사용 불가
//immutableReference.typeMethod()


//생각해보기 -> 사람을 나타내는 클래스 생성
class Person {
    var name: String = "unknown"
    var `class`:String = "Swift" //?
    //타입 메서드
    class func selfintroduce(){
        print("학생 타입입니다. ")
    }
    //self는 인스턴스 자신을 칭하는 키워드 -> 선택 사항
    func selfintroduce(){
        print("저는 \(self.class)번 \(name)압나더,")
    }
}
