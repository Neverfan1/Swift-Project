//
//  DateConverter.swift
//  VKProject
//
//  Created by Данила Парамин on 30.08.2022.
//

import Foundation

func converterDate(inputDate: String) -> String{
    // Create Date Formatter
    let olDateFormatter = DateFormatter()
    let convertDateFormatter = DateFormatter()
    
    var newDateString = ""
    print(inputDate.numberOfOccurrencesOf(string: "."))
    
    if inputDate.numberOfOccurrencesOf(string: ".") == 1{
        // Set Date Format
        olDateFormatter.dateFormat = "dd.MM"
        let newDate = olDateFormatter.date(from: inputDate)
        
        convertDateFormatter.dateFormat = "dd MMM"
        newDateString =  convertDateFormatter.string(from: newDate!)
    }
    
    if inputDate.numberOfOccurrencesOf(string: ".") == 2{
        // Set Date Format
        olDateFormatter.dateFormat = "dd.MM.yyyy"
        let newDate = olDateFormatter.date(from: inputDate)
        
        convertDateFormatter.dateFormat = "MMM dd, yyyy"
        newDateString =  convertDateFormatter.string(from: newDate!)
        
    }
    return newDateString
}
