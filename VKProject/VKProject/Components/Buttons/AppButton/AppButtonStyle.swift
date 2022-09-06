//
//  AppButtonStyle.swift
//  school
//
//  Created by Данила Парамин on 21.07.2022.
//

import Foundation
import SwiftUI

enum AppButtonStyle {
    case authorization
    case exit
    
    var background: Color {
        switch self {
        case .authorization: return Color.blue
        case .exit: return Color.red
        }
    }
    
    var textColor: Color {
        switch self {
        case .authorization: return Color.white
        case .exit: return Color.white
        }
    }
    
    var borderColor: Color {
        switch self {
        case .authorization: return Color.blue
        case .exit: return Color.red
        }
    }
}

