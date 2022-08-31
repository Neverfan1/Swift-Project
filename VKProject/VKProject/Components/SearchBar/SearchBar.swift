//
//  SearchBar.swift
//  VKProject
//
//  Created by Данила Парамин on 30.08.2022.
//

import SwiftUI

struct SearchBar: View{
    
    @Binding var text: String
    
    var body: some View{
        HStack(spacing: 15){
            Image(systemName: "magnifyingglass")
                .font(.system(size: 23, weight: .bold))
                .foregroundColor(.gray)
            
            TextField("Поиск", text: $text)
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(Color.primary.opacity(0.05))
        .cornerRadius(8)
        .padding(.horizontal)
        
    }
    
}
