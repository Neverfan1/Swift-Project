//
//  GroupsCellView.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import SwiftUI
import Combine

struct GroupsCellView: View {
    let model: GroupModel
    let goToInfo: PassthroughSubject<GroupModel, Never>
    
    
    var body: some View {
        Button {
            goToInfo.send(model)
        } label: {
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
}

private extension GroupsCellView {
    var groupPhoto: some View{
        NetworkImage(imageURL: URL(string:model.photo200),
                     width: 43,
                     height: 43,
                     cornerRadius: 100)
    }
    
    var groupName: some View{
        Text(model.name)
            .lineLimit(1)
            .truncationMode(.tail)
            .foregroundColor(.primary)
    }
    
    var activity: some View{
        
        Text(model.activity)
            .lineLimit(1)
            .truncationMode(.tail)
            .font(.caption2)
            .foregroundColor(.primary)
            .opacity(0.4)
        
    }
}

//struct GroupsCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupsCellView(model: .group_mock1())
//    }
//}
