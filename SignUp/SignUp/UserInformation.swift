//
//  UserInformation.swift
//  SignUp
//
//  Created by 지희의 MAC on 2022/08/01.
//

import Foundation

class UserInformation{
    static let shared: UserInformation=UserInformation()
    
    var id: String?
    var password: String?
    var introduce: String?
    var birthday: Date?
    var PhoneNumber: String?
}
