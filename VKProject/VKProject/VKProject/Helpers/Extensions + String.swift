//
//  Extensions + String.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import Foundation

extension Optional where Wrapped == String {
    
    var orEmpty: String {
        guard let value = self else { return "" }
        return value
    }
}
