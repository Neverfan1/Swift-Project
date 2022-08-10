//
//  SettingsCellView.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import SwiftUI

struct SettingsCellView: View {
    
    let model: ButtonModel
    let action: () -> Void
    
    var body: some View {
        
        Button(action: model.action) {
        VStack{
            Button(action: action){
            HStack{
                icon
                label
                chevronRight

                    }
                }
            }
        }
    }
}


private extension SettingsCellView{
    
    var icon: some View{
        VStack{
            model.img
                .renderingMode(.original)
                .resizable()
                .frame(width: 35, height: 35)
                .padding(8)
        }
        .frame(width: UIScreen.main.bounds.width/6)
    }
    
    var label: some View{
        VStack{
            Text(model.label)
                .foregroundColor(Color.black)
                .font(.system(size: 20))
        }
        .frame( maxWidth: .infinity, alignment:.leading)
    }
    
    var chevronRight: some View{
        Image(systemName: "chevron.right")
            .padding()
            .foregroundColor(Color.gray.opacity(0.7))
            .font(.system(size: 16, weight: .bold ))
    }
    
}

struct SettingsCellView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCellView(model: .vk_mock1(), action: {})
    }
}

