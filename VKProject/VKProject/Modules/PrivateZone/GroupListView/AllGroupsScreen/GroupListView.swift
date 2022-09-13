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
        .toolbar {
            ToolbarItem(placement: .principal) {
                TabBar(title: Strings.groups, refresh: true, action: refresh)
            }
            
        }
        .navigationTitle(Strings.groups)
    }
}

extension GroupListView {
    
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    
    func pagination(){
        viewModel.input.paginationAction.send()
        onApperSend()
        
    }
    
    func refresh() {
        viewModel.input.refreshView.send()
        viewModel.output.groups = []
        viewModel.input.onAppear.send()
    }
    
    
    @ViewBuilder var scrollContent: some View{
        ScrollView(.vertical, showsIndicators: false) {
            
            SearchBar(text: $text)
            LazyVStack{
            ForEach(text == "" ?  viewModel.output.groups:
                        viewModel.output.groups.filter{
                $0.name.lowercased().contains(text.lowercased())}) { model in
                    
                    
                    GroupsCellView(model: model, goToInfo: viewModel.input.model)
                        .onAppear {
                            if viewModel.output.groups.last?.id == model.id{
                                pagination()
                            }
                        }
                    Divider()
                }
        }
        }
        
    }
}



//struct GroupListView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupListView()
//    }
//}

