//
//  SettingsListView.swift
//  VKProject
//
//  Created by Данила Парамин on 10.08.2022.
//

import SwiftUI

struct SettingsListView: View {
    
    @StateObject private var viewModel = SettingsListViewModel()
    
    let user: User = .mock5()
    
    let firstSection: [ButtonModel] = [
        .vk_mock1(),
        .vk_mock2()
        
    ]
    
    var secondSection: [ButtonModel] = [
        .vk_mock3(),
        .vk_mock4(),
        .vk_mock5(),
        .vk_mock6(),
        .vk_mock7(),
        .vk_mock8()
        
    ]
    
    var thirdSection: [ButtonModel] = [
        .vk_mock9(),
        .vk_mock10(),
        .vk_mock11()
    ]
    
    var fourthSection: [ButtonModel] = [
        .vk_mock12(),
        .vk_mock13()
    ]
    
    
    
    var body: some View {
        VStack{
            
            labelSettings
            
            ScrollView(.vertical,
                       showsIndicators: false){
                
                SettingsProfileView(model: user)
                firstSectionButtons
                secondSectionButtons
                thirdSectionButtons
                fourthSectionButtons
                exitButton
                
            }
        }
    }
}



private extension SettingsListView{
    
    var labelSettings: some View{
        
        HStack{
            Text("Настройки")
                .padding()
                .font(.title2.bold())
        }
    }
    
    var firstSectionButtons: some View{
        
        VStack{
            ForEach(firstSection) { model in
                SettingsCellView(model: model, action: {
                    TapID(id: model.id)
                })
            }
            Divider()
                .foregroundColor(Color.gray)
                .frame(width: UIScreen.main.bounds.width/1.1)
        }
        
    }
    
    var secondSectionButtons: some View{
        
        VStack{
            ForEach(secondSection) { model in
                SettingsCellView(model: model, action: {
                    TapID(id: model.id)
                })
            }
            Divider()
                .foregroundColor(Color.gray)
                .frame(width: UIScreen.main.bounds.width/1.1)
        }
    }
    
    var thirdSectionButtons: some View{
        
        VStack{
            ForEach(thirdSection) { model in
                SettingsCellView(model: model, action: {
                    TapID(id: model.id)
                })
            }
            Divider()
                .foregroundColor(Color.gray)
                .frame(width: UIScreen.main.bounds.width/1.1)
        }
    }
    
    var fourthSectionButtons: some View{
        
        VStack{
            ForEach(fourthSection) { model in
                SettingsCellView(model: model, action: {
                    TapID(id: model.id)
                })
            }
            Divider()
                .foregroundColor(Color.gray)
                .frame(width: UIScreen.main.bounds.width/1.1)
        }
    }
    
    var exitButton: some View{
        
    
        Button {
            LocalStorage.current.isComplited = false
            AuthenticationLocalService.shared.status.send(false)
//            LocalStorage.current.vkId = nil
//            LocalStorage.current.token = nil
        } label: {
            Text("Exit")
                .foregroundColor(Color.red)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.top, 30)
                .padding(.leading, 21)
                .padding(.bottom, 50)
                .font(.title3)
        }

    }
    
}






private extension SettingsListView{
    
    func TapID(id: Int) {
        viewModel.input.TapID.send(id)
        
    }
}




struct SettingsListView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsListView()
    }
}
