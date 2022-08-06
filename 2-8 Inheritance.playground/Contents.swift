import UIKit

class Person{
    var name:String = ""
    
    func selfIntroduce() {
        print("저는 \(name)입니다.")
    }
    //final 키워드 - 재정의 방지
    final func sayHello() {
        print("Hello")
    }
    //static - 타입 메서드, 재정의 불가
    static func typeMethod(){
        print("type method-static")
    }
    //class- 재정의 가능 타입 메서드
    class func classMethod(){
        print("type method-class")
    }
    //재정의 가능한 class 메서드여도 final 사용하면 재정의 불가
    //static == final class
    final class func finalClassMethod(){
        print("type method - final class")
    }
}

class Student: Person {
    var major: String = ""
    
    override func selfIntroduce() {
        print("저는 \(name)이고, 전공은 \(major)입니다")
    }
    
    override class func classMethod() {
        print("overriden type method - class")
    }
    
    // static을 사용한 타입 메서드는 재정의 불가
//    override static func typeMethod() {    }
    
    // final 키워드를 사용한 메서드, 프로퍼티는 재정의 불가
//    override func sayHello() {    }
//    override class func finalClassMethod() {    }

}


let yagom: Person = Person()
let hana: Student = Student()

yagom.name = "yagom"
hana.name = "hana"
hana.major = "Swift"

yagom.selfIntroduce()
// 저는 yagom입니다

hana.selfIntroduce()
// 저는 hana이고, 전공은 Swift입니다

Person.classMethod()
// type method - class

Person.typeMethod()
// type method - static

Person.finalClassMethod()
// type method - final class


Student.classMethod()
// overriden type method - class

Student.typeMethod()
// type method - static

Student.finalClassMethod()
// type method - final class
