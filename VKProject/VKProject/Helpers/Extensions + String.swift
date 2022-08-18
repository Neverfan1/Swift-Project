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

//extension String
//{
//    func replace(target: String, withString: String) -> String
//    {
//        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
//    }
//}

extension String {
    var withoutSpecialCharacters: String {
        return self.components(separatedBy: CharacterSet.symbols).joined(separator: "")
    }
}
