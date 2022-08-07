import UIKit

//init 이용 인스턴스의 초기값 전달
class PersonB {
    var name: String
    var age: Int
    var nickName: String
    
    // 이니셜라이저
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}


//프로퍼티의 초기값이 꼭 필요 없을 때
//옵셔널을 사용, class 내부의 init 사용 시 convenience 사용
class PersonC {
    var name: String
    var age: Int
    var nickName: String?
    
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }

