//
//  UserCellView.swift
//  school
//
//  Created by Данила Парамин on 28.07.2022.
//

import SwiftUI



struct UserCellView: View {
    
    let model: User
    
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Circle()
                        .frame(width: 90, height: 90)
                        .foregroundColor(model.color)
                    Text(model.firsName)
                    Text(model.seconName)
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width/3)
                VStack{
                    Text(String(model.age))
                        .font(.system(size: 34, weight: .bold))
                    
                }
                .frame( maxWidth: .infinity, alignment: .center)
            }
        }
        .frame( maxWidth: .infinity, alignment: .leading)
        .border(Color.blue, width: 2)
    }
}







struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserCellView(model: .mock2())
    }
}
