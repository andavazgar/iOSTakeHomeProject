//
//  InfoWithLabel.swift
//  iOSTakeHomeProject
//
//  Created by Andres Vazquez on 2022-11-15.
//

import SwiftUI

struct InfoWithLabel<Content>: View where Content: View {
    let label: String
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(label)
                    .bold()
                content()
            }
        }
    }
}

struct InfoWithLabel_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8) {
            InfoWithLabel(label: "First Name", value: "George")
            InfoWithLabel(label: "Support") {
                Label("Link", systemImage: "link")
            }
        }
    }
}

// MARK: - Extensions
extension InfoWithLabel {
    init(label: String, value: String) where Content == Text {
        self.init(label: label) {
            Text(value)
        }
    }
}
