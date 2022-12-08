//
//  FetchedImage.swift
//  iOSTakeHomeProject
//
//  Created by Andres Vazquez on 2022-11-15.
//

import SwiftUI

struct FetchedImage: View {
    let url: URL
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(18/13, contentMode: .fill)
                .frame(height: 130)
        } placeholder: {
            Rectangle()
                .fill(.background)
                .frame(height: 130)
                .overlay {
                    ProgressView()
                }
        }
    }
}

struct FetchedImage_Previews: PreviewProvider {
    static var previews: some View {
        if let avatarURL = URL(string: StaticJSONMapper.previewUser.data.avatar) {
            FetchedImage(url: avatarURL)
        }
    }
}
