//
//  Button.swift
//  school
//
//  Created by Данила Парамин on 01.08.2022.
//


import Foundation
import SwiftUI

struct ButtonModel: Identifiable{
    let id : Int
    let label: String
    let img: Image
//    let sublabel: String
//    let style: AppButtonStyleSettings
    let action:  () -> Void
    
  

}

extension ButtonModel{
//    static func mock() -> Self {
//
//        ButtonModel(id: 1,label: "Wi-Fi", sublabel: "Keenetic-0827", style: .button1) {}
//
//    }
//
//    static func mock2() -> Self {
//
//        ButtonModel(id: 2,label: "Bluetooth", sublabel:"", style: .button2) {}
//
//    }
//
//
//    static func mock3() -> Self {
//
//        ButtonModel(id: 3,label: "Режим модема", sublabel: "", style: .button3) {}
//
//    }
//
//
//    static func mock4() -> Self {
//
//        ButtonModel(id:4 ,label: "Сотовая связь", sublabel: "", style: .button4) {}
//
//    }
//
//    static func mock5() -> Self {
//
//        ButtonModel(id: 5,label: "Закладки", sublabel: "", style: .button5) {}
//
//    }
//
//    static func mock6() -> Self {
//
//        ButtonModel(id: 6,label: "Календарь", sublabel: "", style: .button6) {}
//
//    }
//
//    static func mock7() -> Self {
//
//        ButtonModel(id: 7,label: "Хранилище", sublabel: "", style: .button7) {}
//
//    }
//
//    static func mock8() -> Self {
//
//        ButtonModel(id: 8,label: "Папки", sublabel: "", style: .button8) {}
//
//    }
//
    static func vk_mock1() -> Self {
    
        ButtonModel(id: 1,label: "Уведомления", img: Image("1")) {}
       
    }
    
    
    static func vk_mock2() -> Self {
    
        ButtonModel(id: 2,label: "Не беспокоить", img: Image("2")) {}
       
    }
    
    static func vk_mock3() -> Self {
    
        ButtonModel(id: 3,label: "Аккаунт", img: Image("3")) {}
       
    }
    
    static func vk_mock4() -> Self {
    
        ButtonModel(id: 4,label: "Внешний вид",img: Image("4")) {}
       
    }
    
    
    static func vk_mock5() -> Self {

        ButtonModel(id: 5, label: "Приложение", img: Image("5")){}

    }
    
    static func vk_mock6() -> Self {
    
        ButtonModel(id: 6,label: "Приватность", img: Image("6")) {}
       
    }
    
    static func vk_mock7() -> Self {
    
        ButtonModel(id: 7,label: "Черный список", img: Image("7")) {}
       
    }
    
    static func vk_mock8() -> Self {
    
        ButtonModel(id: 8,label: "Определитель номера", img: Image("8")) {}
       
    }
    
    static func vk_mock9() -> Self {
    
        ButtonModel(id: 9,label: "Баланс", img: Image("9")) {}
       
    }
    
    static func vk_mock10() -> Self {
    
        ButtonModel(id: 10,label: "Подписки", img: Image("10")) {}
       
    }
    
    static func vk_mock11() -> Self {
    
        ButtonModel(id: 11,label: "Денежные переводы",img: Image("11")) {}
       
    }
    
    static func vk_mock12() -> Self {
    
        ButtonModel(id: 12,label: "О приложении", img: Image("12")) {}
       
    }
    
    static func vk_mock13() -> Self {
    
        ButtonModel(id: 13,label: "Помощь", img: Image("13")) {}
       
    }
    


}

