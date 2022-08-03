//
//  ServerUser.swift
//  school
//
//  Created by Данила Парамин on 28.07.2022.
//

import Foundation

struct ServerUser: Decodable{
    
    let id: Int
    let firstName: String?
    let secondName: String?
    let sex: Int
    let age: Int?
    let color: String?
    
    
}
