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
        Button {
            TapExit()
        } label: {
            Text(Strings.exit)
        }


    }
}

private extension ExitView{
    
    func TapExit() {
        viewModel.input.TapExit.send()
        
    }
}

struct ExitView_Previews: PreviewProvider {
    static var previews: some View {
        ExitView(viewModel: ExitViewModel())
    }
}
