//
//  GroupInfoView.swift
//  VKProject
//
//  Created by Данила Парамин on 18.08.2022.
//

import SwiftUI
import Kingfisher

struct GroupInfoView: View {
    
    let model: GroupModel
    
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                headerGroup
                Divider()
                memmberCount
                Divider()
                ageLimit
                Divider()
                description
                Divider()
                activity
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width/1.04)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(14)
        }
    }
}

extension GroupInfoView{
    var headerGroup: some View{
        HStack{
            KFImage(URL(string:model.photo200))
                .renderingMode(.original)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(100)
            Text(model.name)
            Spacer()
        }
    }
    
    var memmberCount: some View{
        HStack{
            Text("Подписчики: \(model.membersCount)")
            Spacer()
            
        }
    }
    
    var ageLimit: some View{
        HStack{
            Text("Возрастное ограничение: \(model.ageLimits)")
            Spacer()
        }
    }
    
    var description: some View{
        HStack{
            Text("Описание: \(model.description)")
            Spacer()
            
        }
    }
    
    var activity: some View{
        HStack{
            Text("Тематика группы: \(model.activity)")
            Spacer()
        }
    }
    
    
}

struct GroupInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GroupInfoView(model: .group_mock1())
    }
}
