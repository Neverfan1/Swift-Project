//
//  User.swift
//  school
//
//  Created by Данила Парамин on 28.07.2022.
//

import Foundation
import SwiftUI

struct User: Identifiable{
    let id = UUID()
    let firsName: String
    let seconName: String
    let sex: UserSex
    let age: Int
    let color: Color
    let numberPhone: String
    let photo: Image
    
    var fullName: String{
        firsName + " " + seconName
    }
}

extension User{
    static func mock() -> Self {
    
        
        User(firsName: "Jon",
             seconName: "Snow",
             sex: .boy,
             age: 13,
             color: Color.red,
        numberPhone:"123",
             photo: Image(systemName: "trash"))
    }
    
    static func mock2() -> Self {
        
        
        User(firsName: "Tim",
             seconName: "Brown",
             sex: .boy,
             age: 14,
             color: Color.green,
             numberPhone:"123",
                  photo: Image(systemName: "trash"))
    }

    
    static func mock3() -> Self {
        
        
        User(firsName: "Liza",
             seconName: "FKladflksm",
             sex: .girl,
             age: 25,
             color: Color.blue,
             numberPhone:"123",
                  photo: Image(systemName: "trash"))
    }

    
    static func mock4() -> Self {
        
        
            User(firsName: "Tom",
                 seconName: "Jerry",
                 sex: .boy,
                 age: 45,
                 color: Color.purple,
                 numberPhone:"123",
                      photo: Image(systemName: "trash"))
    }
    
    static func mock5() -> Self {
        
        
            User(firsName: "Данила",
                 seconName: "Парамин",
                 sex: .boy,
                 age: 21,
                 color: Color.purple,
                 numberPhone:"+7 *** ***  ** 43",
                      photo: Image("avatar"))
    }

}

enum UserSex: Int {
    case boy = 1
    case girl = 2
}

