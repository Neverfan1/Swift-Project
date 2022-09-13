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
                TabBar(title: Strings.photo, refresh: true, action: refresh)
            }
            
        }
        .navigationTitle(Strings.photo)
    }
}

extension PhotoListView {
    
    var scrollConten: some View{
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack{
                ForEach(viewModel.output.photo) { model in
                    PhotoCellView(model: model)
                        .onAppear {
                            if viewModel.output.photo.last?.id == model.id{
                                pagination()
                            }
                        }
                    
                    Divider()
                }
            }
        }
    }
    
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    
    func refresh() {
        viewModel.input.refreshView.send()
        viewModel.output.photo = []
        viewModel.input.onAppear.send()
    }
    
    func pagination(){
        viewModel.input.paginationAction.send()
        onApperSend()
        
    }
    
}

//struct PhotoListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoListView()
//    }
//}

