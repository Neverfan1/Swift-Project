//
//  AppButtonStyle.swift
//  school
//
//  Created by Данила Парамин on 21.07.2022.
//

import Foundation
import SwiftUI

enum AppButtonStyle {
    case button1
    case button2
    case button3
    
    var background: Color {
        switch self {
        case .button1: return Color.blue
        case .button2: return Color.white
        case .button3: return Color.green
        }
    }
    
    var textColor: Color {
        switch self {
        case .button1: return Color.white
        case .button2: return Color.black
        case .button3: return Color.white
        }
    }
        
    var borderColor: Color {
        switch self {
        case .button1: return Color.blue
        case .button2: return Color.gray.opacity(0.2)
        case .button3: return Color.green
        }
    }
    
    var logo: Bool {
        switch self {
        case .button1: return false
        case .button2: return true
        case .button3: return false
            
        }
    }
}
