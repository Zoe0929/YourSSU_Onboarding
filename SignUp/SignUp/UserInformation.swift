//
//  UserInformation.swift
//  SignUp
//
//  Created by 지희의 MAC on 2022/08/01.
//

import Foundation

class UserInformation{

    static let shared: UserInformation = UserInformation()
    private init() {    } //외부 접근을 막기 위해 private
    
    private var _id: String?
     public var id: String? {
       get {
         return _id
       }
       set {
           return _id = newValue
       }
     }
    private var _password: String?
    public var password: String? {
        get{
            return _password
        }
        set{
            return _password = newValue
        }
    }
    private var _introduce: String?
    public var introduce: String? {
        get{
            return _introduce
        }
        set{
            return _introduce = newValue
        }
    }
    private var _phoneNumber: String?
    public var phoneNumber: String? {
        get{
            return _phoneNumber
        }
        set{
            return _phoneNumber = newValue
        }
    }
    private var _birthday: Date?
    public var birthday: Date?{
        get{
            return _birthday
        }
        set{
            return _birthday = newValue
        }
    }
    
    func deleteDate(){
        self.id = nil
        self.password = nil
        self.introduce = nil
        self.phoneNumber = nil
        self.birthday = nil
    }
}
