import UIKit

//프로퍼티 - 구조체, 클래스, 열거형 내부에 구현
struct Student{
    
    //인스턴스 저장 프로퍼티 - 값 저장
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0
    
    //인스턴스 연산 프로퍼티 - 값 연산.
    //쓰기 -> set, 읽기 -> get
    var weternAge: Int{
        get{
            return koreanAge-1
        }
        set(inputValue){
            koreanAge=inputValue+1
        }
    }
    //타입 저장 프로퍼티
    static var typeDescription: String = "학생"
    
    //인스턴스 메서드
    func selfintroduce(){
        print("저는 \(self.class)반 \(name)입니다.")
    }
    
    //읽기 전용 인스턴스 연산 프로퍼티 - 위의 인스턴스 메서드와 같은 기능
    var selfIntroduction: String{
        get {
            return "저는 \(self.class)반 \(name)입니다."
        }
    }
    
    
    var ageIntroduction: String{
            return "한국나이로는 \(self.koreanAge), 미국 나이는 \(weternAge)입니다."
    }
    
    //읽기 전용 타입 연산 프로퍼티 - get 생략 가능
    static var selfIntroduction: String{
        return "학생타입입니다."
    }
        
}

print(Student.selfIntroduction)

var Jihee: Student = Student()
Jihee.koreanAge = 23

Jihee.name = "Zoe"
print(Jihee.name)

print(Jihee.selfIntroduction)
print(Jihee.ageIntroduction)


//응용
struct Money {
    var currencyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
    }
}

var moneyInMyPocket = Money()

moneyInMyPocket.won = 11000

print(moneyInMyPocket.won)
// 11000

moneyInMyPocket.dollar = 10

print(moneyInMyPocket.won)
// 11000

//저장 프로퍼티와 연산 프로퍼티의 기능은 함수, 메서드, 클로저, 타입 등의 외부에 위치한 지역/전역 변수에도 모두 사용 가능

var a: Int = 100
var b: Int = 200
var sum: Int {
    return a + b
}

print(sum) // 300
