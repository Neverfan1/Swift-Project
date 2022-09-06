//
//  TabBar.swift
//  VKProject
//
//  Created by Данила Парамин on 05.09.2022.
//

import SwiftUI

struct TabBar: View {
    
    let title: String
    let refresh: Bool
    let action: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            Text(title)
                .font(.system(size: 19, weight: .bold))
            Spacer()
            
            if refresh{
            ButtonRefresh(onRefresh: action)
            }
            
        }
        .padding(.bottom, 10)
        
    }
}

