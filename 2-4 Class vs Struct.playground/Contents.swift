import UIKit

class SomeClass{
    var value = "Property"
} //reference type - class

struct SomeStruct {
    var value = "Property"
} //value type - struct

func changeValueClass(classInstance : SomeClass){
    var localVar : SomeClass=classInstance
    localVar.value="ABC"
}

func changeValueStruct (structInstance : SomeStruct){
    var localVar: SomeStruct = structInstance
    localVar.value="ABC"
}

var someClassInstance : SomeClass = SomeClass()

var someStructInstance : SomeStruct = SomeStruct()

changeValueClass(classInstance: someClassInstance)
changeValueStruct(structInstance: someStructInstance)

print(someClassInstance.value) //ABC(값이 변경됨)
print(someStructInstance.value) // Property(값 변경되지 않음)

//값 타입 복사의 경우 같은 인스턴스 2개가 생성된 것 -> 2개는 별개의 인스턴스
//레퍼런스 타입 복사의 경우 같은 참조를 가리키는 인스턴스 2개 생성 -> 참조가 같으므로 하나의 인스턴스에서 값을 변경하면 다른 인스턴스에도 영향을 미침.

