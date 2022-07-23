import UIKit

enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

// 열거형 타입과 케이스를 모두 사용하여도 됩니다
var day: Weekday = Weekday.mon

// 타입이 명확하다면 .케이스 처럼 표현해도 무방합니다
day = .tue

print(day) // tue
		
switch day{
case .mon, .tue,.wed,.thu:
    print("평일입니다.")
case .fri:
    print("금요일!")
case .sat, .sun:
    print("주말입니다")
    
}

//rawValue 원시값
enum Fruit: Int{
    case apple = 0
    case grape
    case peach
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")


enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("School.middle.rawValue=\(School.middle.rawValue)")
print("School.university.rawValue=\(School.university.rawValue)")

//원시값을 이용한 초기화
let apple : Fruit? = Fruit(rawValue: 0)
//if let을 이용해서 언래핑 후 rawValue에 해당하는 case값 곧바로 사용가능
if let orange : Fruit = Fruit(rawValue: 5){
    print("rawValue 5에 해당하는 case는 \(orange)입니다.")
} else{
    print("rawValue 5에 해당하는 case가 없습니다.")
} //rawValue 5에 해당하는 case가 없습니다.

enum Month : Int {
    case dec = 12 , jan = 1, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage(){
        switch self{
        case .mar, .apr, .may:
            print("Spring")
        case .jun, .jul, .aug:
            print("Summer")
        case .sep, .oct, .nov:
            print("Fall")
        case .dec, .jan, .feb:
            print("Winter")
            
        }
    }
}

Month.jul.printMessage()
Month.jul.rawValue
Month(rawValue: 7)?.printMessage() //Month(rawValue : 7)은 옵셔널, 언래핑 후 사용 가능.
