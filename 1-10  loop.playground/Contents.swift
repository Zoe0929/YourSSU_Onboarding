import UIKit

//swift의 반복문
//1. for in - 기존 언어의 for each와 유사
//dictionary의 경우에는 이터레이션 아이템으로 튜플이 들어옴

var integers=[1,2,3]
let people=["yagom":10, "ete":15, "mike":12]

for integer in integers {
    print(integer)
}

for(name,age) in people{
    print("\(name):\(age)")
}

//2. while문
while integers.count>1{
    integers.removeLast()
}


//3.repeat-while: do while문과 유사
repeat{
    integers.removeLast()
} while integers.count>0
