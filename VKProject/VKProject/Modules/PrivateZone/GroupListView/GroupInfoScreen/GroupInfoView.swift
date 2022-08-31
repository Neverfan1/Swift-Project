//
//  GroupInfoView.swift
//  VKProject
//
//  Created by Данила Парамин on 18.08.2022.
//

import SwiftUI


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
            NetworkImage(imageURL: URL(string:model.photo200),
                         width: 60,
                         height: 60,
                         cornerRadius: 100)
            Text(model.name)
            Spacer()
        }
    }
    
    var memmberCount: some View{
        HStack{
            Text(Strings.memmberCountColon + String(model.membersCount))
            Spacer()
        }
    }
    
    var ageLimit: some View{
        HStack{
            Text(Strings.ageLimitColon + model.ageLimits.description)
            Spacer()
        }
    }
    
    var description: some View{
        HStack{
            Text(Strings.descriptionColon + model.description)
            Spacer()
        }
    }
    
    var activity: some View{
        HStack{
            Text(Strings.activityColon + model.activity)
            Spacer()
        }
    }
}

struct GroupInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GroupInfoView(model: .group_mock1())
    }
}
