//
//  GroupListView.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import SwiftUI

struct GroupListView: View {
    
    @StateObject var viewModel: GroupListViewModel
    @State private var text = ""
    
    var body: some View {
        VStack{
            scrollContent
        }
        .onAppear(perform: onApperSend)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Strings.groups)
    }
}

extension GroupListView {
    
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    
    var header: some View{
        Text(Strings.groups)
            .bold()
            .font(.title)
            .onAppear(perform: onApperSend)
    }
    
    var scrollContent: some View{
        ScrollView(.vertical, showsIndicators: false) {
            PullToRefreshView {onApperSend() }
            SearchBar(text: $text)
            ForEach(text == "" ?  viewModel.output.groups:
                        viewModel.output.groups.filter{
                $0.name.lowercased().contains(text.lowercased())}) { model in
                    GroupsCellView(model: model, goToInfo: viewModel.input.model)
                    Divider()
                }
            
        }
        
    }
}

//struct GroupListView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupListView()
//    }
//}

