//
//  PersonItemView.swift
//  iOSTakeHomeProject
//
//  Created by Andres Vazquez on 2022-11-14.
//

import SwiftUI

struct PersonItemView: View {
    let person: User
    
    var body: some View {
        VStack(spacing: 0) {
            if let imageURL = URL(string: person.avatar) {
                FetchedImage(url: imageURL)
            }
            
            VStack(alignment: .leading) {
                Pill(id: person.id)
                Text("\(person.firstName) \(person.lastName)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
            .padding(.vertical, 5)
            .background(Theme.detailBackground)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Theme.text.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}

struct PersonItemView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            
            PersonItemView(person: StaticJSONMapper.previewUser.data)
                .padding()
        }
    }
}
