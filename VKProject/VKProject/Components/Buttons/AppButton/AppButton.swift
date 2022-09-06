//
//  AppButton.swift
//  school
//
//  Created by Данила Парамин on 21.07.2022.
//

import SwiftUI

struct AppButton: View {
    
    @Environment(\.isEnabled) private var isEnabled
    
    let style: AppButtonStyle
    let title: String
    let action: () -> Void

    
    var body: some View {
        
        Button(action: action) {
            
            HStack{
                Spacer()
                Text(title)
                    .font(.callout)
                    .foregroundColor(style.textColor)
                Spacer()

            }
                .padding()
                .background(style.background)
                .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(style.borderColor,lineWidth: 3)
                        )
                .cornerRadius(14)
                .padding(.horizontal, 12)
                
        }
        
    }
}


struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        AppButton(style: .exit,
                  title: Strings.exit,
                  action: {})
        
        
    }
}
