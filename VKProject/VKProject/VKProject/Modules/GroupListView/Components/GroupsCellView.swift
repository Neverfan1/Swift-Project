//
//  GroupsCellView.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import SwiftUI

struct GroupsCellView: View {
    let model: GroupModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
            Text(model.name)
                .lineLimit(1)
                .truncationMode(.tail)
            if model.description != ""{
                Text(model.description)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .font(.caption2)
                    .opacity(0.4)
                }
            }
            Spacer()
            
        }
        .padding()
    }
}

private extension GroupsCellView {

}

struct GroupsCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsCellView(model: .group_mock1())
    }
}
