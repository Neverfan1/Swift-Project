//
//  TestView.swift
//  VKProject
//
//  Created by Данила Парамин on 18.08.2022.
//
import SwiftUI

struct TestView: View {
    
    //    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = GroupListViewModel()
    @State private var searchText = ""
    
    var body: some View {
        VStack{
            header
            scrollContent
        //        .onChange(of: viewModel.output.error) { error in
        //            if error {
        //                presentationMode.wrappedValue.dismiss()
        //            }
        //        }
        }
    }
}

extension TestView {
    
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    
    var header: some View{
        Text("Группы")
            .bold()
            .font(.title)
            .onAppear(perform: onApperSend)
    }
    
    var scrollContent: some View{
        ScrollView(.vertical, showsIndicators: false) {
            PullToRefreshView {onApperSend() }
            ForEach(viewModel.output.groups) { model in
                GroupInfoView(model: model)
                Divider()
            }
            
        }
    
    }
    
    
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        GroupInfoView(model: .group_mock1())
    }
}
