//
//  AppTextField.swift
//  school
//
//  Created by Данила Парамин on 26.07.2022.
//

import SwiftUI

struct AppTextField: View {
    
    @Binding var text: String
    
    var body: some View {
        TextField("Телефон или почта", text: $text)
            .padding()
            .background(Color.gray.opacity(0.17))
            .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(.gray.opacity(0.34),lineWidth: 3)
                    )
            .cornerRadius(14)
            .padding(.horizontal, 12)
            .font(.callout)
            .padding(.bottom, 5)    }
}

struct AppTextField_Previews: PreviewProvider {
    static var previews: some View {
        AppTextField(text: .constant("true"))
    }
}
