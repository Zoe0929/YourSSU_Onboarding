import UIKit

//옵셔널 추출

func printName(_ name: String){
    print(name)
}

var myName: String? = nil

// printName(myName) 전달되는 타입이 다르기 때문에 컴파일 오류 발생
//String 과 String?은 같지 않다..

if let name: String = myName{
    printName(name)
} else{
    print("Myname==nil")
}

var yourName: String! = nil

if let name: String = yourName{
    printName(name)
}else {
    print("yourName==nil")
}

//, 사용해서 한번에 여러 옵셔널 바인딩 가능
// 모두 값이 있을 때만 씰행됨
myName="yagom"
yourName=nil

if let name = myName, let friend = yourName{
    print("\(name) and \(friend)")
}

yourName="hana"

if let name=myName, let friend=yourName{
    print("\(name) and \(friend)")
}

//강제 추출- 옵셔널에 값이 들어있는지 아닌지 확인하지 않고 강제로 값을 꺼내는 방식
// !을 이용해서 강제 추출
//값이 없을 경우 nil -> 런타임 오류 발생

printName(myName!) // yagom
myName = nil

//print(myName!)
// 강제추출시 값이 없으므로 런타임 오류 발생
yourName = nil

//printName(yourName)
// nil 값이 전달되기 때문에 런타임 오류발생
