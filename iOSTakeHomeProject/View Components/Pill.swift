//
//  Pill.swift
//  iOSTakeHomeProject
//
//  Created by Andres Vazquez on 2022-11-15.
//

import SwiftUI

struct Pill: View {
    let id: Int
    
    var body: some View {
        Text("#\(id)")
            .font(.caption.bold())
            .foregroundColor(.white)
            .padding(.horizontal, 9)
            .padding(.vertical, 4)
            .background(Theme.pill, in: Capsule())
    }
}

struct Pill_Previews: PreviewProvider {
    static var previews: some View {
        Pill(id: 0)
    }
}
