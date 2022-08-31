//
//  UserModel.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import Foundation
import SwiftUI

struct UserModel:Identifiable{
    let id: Int
    let bdate: String
    let country: String
    let city: String
    let photoMaxOrig: String
    let about: String
    let activities: String
    let followersCount: Int
    let universityName: String
    let university: Int
    let faculty: Int
    let facultyName: String
    let graduation: Int
    let albums: Int
    let audios: Int
    let followers: Int
    let friends: Int
    let onlineFriends: Int
    let pages: Int
    let photos: Int
    let videos: Int
    let mutualFriends: Int
    let firstName: String
    let lastName: String
    let screenName: String
    let status: String
    let online: Int
    let onlineMobile: Int
    let canAccessClosed: Bool
    let isClosed: Bool
    
    var fullName: String{
        firstName + " " + lastName
    }
    
    var countryCity: String{
        country + ", " + city
    }
    
    var education : String{
        universityName + ", " + facultyName
    }
}

extension UserModel{
    static func mock() -> Self {
        UserModel(id: 1234444,
                  bdate: "18.06.2001", // дата рождения
                  country: "Россия", // страна
                  city: "Саратов", // город
                  photoMaxOrig: "https://vk.com/neverfan?z=photo154032007_457288116%2Falbum154032007_0%2Frev", // фото
                  about: "Информация о себе", // инфо о юзере
                  activities: "Деятельность", // деятельность
                  followersCount: 100,
                  universityName: "Название института", // Название института
                  university: 0, // id универа
                  faculty: 0, // id  направления
                  facultyName: "Название направления",
                  graduation: 2023, // год окончания
                  albums: 3, // кол-во альбомов
                  audios: 1043, // кол-во музыки
                  followers: 100, // подписчики
                  friends: 234, // друзья
                  onlineFriends: 21, // онлайн друзей
                  pages: 34, // интересные страницы
                  photos: 53, // кол-во фото
                  videos: 32, // кол-во видео
                  mutualFriends: 12, // общие друзья
                  firstName: "Данила", // имя
                  lastName: "Парамин", // фамилия
                  screenName: "screenName",
                  status: "234",
                  online: 1,
                  onlineMobile: 0,
                  canAccessClosed: true, // можно ли просматривать профиль
                  isClosed: true // открыта или закрыта страница
                  )
    }
}


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


