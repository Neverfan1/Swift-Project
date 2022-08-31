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
            header
            scrollConten
        }
    }
}

extension PhotoListView {
    var header: some View{
        Text(Strings.photo)
            .bold()
            .font(.title)
            .onAppear(perform: onApperSend)
    }
    
    var scrollConten: some View{
        ScrollView(.vertical, showsIndicators: false) {
            PullToRefreshView {onApperSend() }
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

