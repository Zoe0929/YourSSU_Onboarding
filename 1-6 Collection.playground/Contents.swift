import UIKit

//1. Array
var integers: Array<Int> = Array<Int>()

//append : 요소 추가
integers.append(1)
integers.append(100)
//contains : 멤버 포함 여부 확인
print(integers.contains(100))
print(integers.contains(99))

//인덱스 이용 접근 가능
integers[0]=99

//멤버 삭제
integers.remove(at: 0) // 0번째 인덱스 삭제
integers.removeLast() // 마지막 요소 삭제
integers.removeAll() // Array의 모든 요소 삭제

//Array.count : Array의 멤버 수
print(integers.count)

//let 이용 불변 Array 선언
let immutableArray=[1,2,3]

//immutableArray.removeAll() //컴파일 오류 -> 수정 불가능
// 배열 -> 구조체, 구조체가 변한다고 인식..

//보충 - 기본값 배열 생성
var threeDoubles=Array(repeating: 0.0, count: 3) // [0.0, 0.0, 0.0]
// + 이용 배열 연산 (+=도 이용 가능)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles+anotherThreeDoubles



//2. Dictionary
var anyDictionary:Dictionary<String,Any>=[String:Any]()
// 위와 동일한 표현
// var anyDictionary: Dictionary <String, Any> = Dictionary<String, Any>()
// var anyDictionary: Dictionary <String, Any> = [:]
// var anyDictionary: [String: Any] = Dictionary<String, Any>()
// var anyDictionary: [String: Any] = [String: Any]()
// var anyDictionary: [String: Any] = [:]
// var anyDictionary = [String: Any]()


//키에 해당하는 값 할당
anyDictionary["someKey"]="value"
anyDictionary["anotherKey"]=100
anyDictionary["order"]="first?"

print(anyDictionary)

//키의 값 변경
anyDictionary["someKey"]="changed"
print(anyDictionary)

anyDictionary.removeValue(forKey: "anotherKey")
anyDictionary["someKey"]=nil
print(anyDictionary)

//let 이용 불변 딕셔너리 생성 가능
let emptyDictionary: [String: String] = [:]
let initalizedDictionary: [String: String] = ["name": "yagom", "gender": "male"]

// let someValue: String = initalizedDictionary["name"] 옵셔널 참고!
//키에 해당하는 값이 있을수도 있고 없을수도 있음, 상수에 넣어줄 수 없음 -> 불확실성.


//3. Set - 중복 허용하지 않음
var integerSet: Set<Int> = Set<Int>()
//insert : 새로운 멤버 입력
integerSet.insert(1)
integerSet.insert(99)
integerSet.insert(99) //중복이 허용되지 않기 때문에 -> inserted false
integerSet.insert(100)

print(integerSet)

//contains: 멤버 포함 여부 확인
print(integerSet.contains(1))
print(integerSet.contains(2))

//remove : 멤버 삭제
integerSet.remove(99)
integerSet.removeAll()

print(integerSet.count)

//Set 연산
let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]
// 합집합
let union: Set<Int> = setA.union(setB)
print(union) // [2, 4, 5, 6, 7, 3, 1]

// 합집합 오름차순 정렬
let sortedUnion: [Int] = union.sorted()
print(sortedUnion) // [1, 2, 3, 4, 5, 6, 7]

// 교집합
let intersection: Set<Int> = setA.intersection(setB)
print(intersection) // [5, 3, 4]

// 차집합
let subtracting: Set<Int> = setA.subtracting(setB)
print(subtracting) // [2, 1]

//print(setA[0]) 순서가 없기 때문에 인덱스 접근 불가. 접근 방법은?
// 배열과 같이 연속적으로 저장 x, 이진 탐색 tree로 구현되어 있음. (찾아보기_...)
