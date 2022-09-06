//
//  ExitView.swift
//  VKProject
//
//  Created by Данила Парамин on 31.08.2022.
//

import SwiftUI

struct ExitView: View {
    @StateObject var viewModel: ExitViewModel
    
    var body: some View {
        VStack{
            topImage
            AppButton(style: .exit, title: Strings.exit) {
                TapExit()
            }
        }
    }
}

private extension ExitView{
    
    func TapExit() {
        viewModel.input.TapExit.send()
        
    }
    
    var topImage: some View{
        Image("exit")
            .renderingMode(.original)
            .resizable()
            .frame(width: 369, height: 369, alignment: .center)
            .cornerRadius(9)
            .padding(.bottom, 50)
        
    }
}

struct ExitView_Previews: PreviewProvider {
    static var previews: some View {
        ExitView(viewModel: ExitViewModel())
    }
}
