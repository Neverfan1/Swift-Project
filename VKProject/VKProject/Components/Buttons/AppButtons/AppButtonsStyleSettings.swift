//
//  AppButtonsStyleSettings.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//


import Foundation
import SwiftUI

enum AppButtonStyleSettings {
    case button1
    case button2
    case button3
    case button4
    case button5
    case button6
    case button7
    case button8
    

        
    var backgroundColor: Color {
        switch self {
        case .button1: return Color.blue
        case .button2: return Color.blue
        case .button3: return Color.green
        case .button4: return Color.green
        case .button5: return Color.green
        case .button6: return Color.red
        case .button7: return Color.blue
        case .button8: return Color.blue
        }
    }
    
    var icon: Image {
        switch self {
        case .button1: return Image("wifi")
        case .button2: return Image("bluetooth")
        case .button3: return Image("personalhotspot")
        case .button4: return Image("antenna.radiowaves.left.and.right")
        case .button5: return Image("bookmark.fill")
        case .button6: return Image("calendar")
        case .button7: return Image("externaldrive")
        case .button8: return Image("folder")
            
        }
    }
}
