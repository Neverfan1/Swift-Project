//
//  GroupsCellView.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import SwiftUI
import Kingfisher

struct GroupsCellView: View {
    let model: GroupModel

    
    var body: some View {
        HStack{
            groupPhoto
            
            VStack(alignment: .leading){

                groupName
                activity
            }
            Spacer()
        }
        .padding()
    }
}

private extension GroupsCellView {
    var groupPhoto: some View{
//        NetworkImage(imageURL: model.photo200, placeholderImage: UImage(systemName: "trash"))
        KFImage(URL(string:model.photo200))
            .renderingMode(.original)
            .resizable()
            .frame(width: 43, height: 43)
            .cornerRadius(100)

    }
    
    var groupName: some View{
        Text(model.name)
            .lineLimit(1)
            .truncationMode(.tail)
    }
    
    var activity: some View{

            Text(model.activity)
                .lineLimit(1)
                .truncationMode(.tail)
                .font(.caption2)
                .opacity(0.4)
    }

}

struct GroupsCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsCellView(model: .group_mock1())
    }
}
