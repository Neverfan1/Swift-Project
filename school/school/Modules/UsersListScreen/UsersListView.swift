//
//  UsersListView.swift
//  school
//
//  Created by Данила Парамин on 28.07.2022.
//

import SwiftUI

struct UsersListView: View {
    
    let users: [User] = [
        .mock(),
        .mock2(),
        .mock3(),
        .mock4()
    ]
    
    var body: some View {
        ScrollView(.vertical,
                   showsIndicators: false){
        VStack{
            ForEach(users) { model in
            UserCellView(model: model)
                
            }
        }
        .padding(.horizontal)
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
