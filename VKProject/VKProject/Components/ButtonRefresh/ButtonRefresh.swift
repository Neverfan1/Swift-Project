//
//  SwiftUIView.swift
//  VKProject
//
//  Created by Данила Парамин on 04.09.2022.
//

import SwiftUI

struct ButtonRefresh: View {
    
    let onRefresh: () -> Void
    
    var body: some View {
        HStack(){
            Spacer()
        Button {
            onRefresh()
        } label: {
            Image(systemName: "gobackward")
                .foregroundColor(.primary)
                .scaleEffect(1.2)
                .frame(width: 50)
        }
        }

    }
}

