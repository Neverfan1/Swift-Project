//
//  NetworkImage.swift
//  VKProject
//
//  Created by Данила Парамин on 12.08.2022.
//

import SwiftUI
import Kingfisher

struct NetworkImage: SwiftUI.View {
    
    @State private var image: UIImage? = nil
    
    let imageURL: URL?

    
    init(imageURL: URL?) {
        self.imageURL = imageURL

    }
    
    var body: some SwiftUI.View {
        Image(uiImage: image ?? UIImage(systemName: "eye.slash")!)
            .resizable()
            .onAppear{
                    loadImage()
            }
        }

    
    
    private func loadImage() {
        guard let imageURL = imageURL, image == nil else { return }
        KingfisherManager.shared.retrieveImage(with: imageURL) { result in
            switch result {
            case .success(let imageResult):
                self.image = imageResult.image
            case .failure:
                break
            }
        }
    }
}
