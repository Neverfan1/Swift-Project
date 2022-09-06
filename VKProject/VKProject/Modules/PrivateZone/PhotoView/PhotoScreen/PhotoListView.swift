//
//  PhotoListView.swift
//  VKProject
//
//  Created by Данила Парамин on 16.08.2022.
//

import SwiftUI

struct PhotoListView: View {
    
    @StateObject var viewModel: PhotoListViewModel
    
    var body: some View {
        VStack{
            scrollConten
        }
        .onAppear(perform: onApperSend)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
                   ToolbarItem(placement: .principal) {
                       TabBar(title: Strings.photo, refresh: true, action: onApperSend)
                   }
                   
        }
        .navigationTitle(Strings.photo)
    }
}

extension PhotoListView {

    var scrollConten: some View{
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(viewModel.output.photo) { model in
                PhotoCellView(model: model)
                Divider()
            }
        }
    }
    
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    
}

//struct PhotoListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoListView()
//    }
//}

