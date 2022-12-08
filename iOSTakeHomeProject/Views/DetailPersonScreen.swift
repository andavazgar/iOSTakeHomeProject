//
//  DetailPersonScreen.swift
//  iOSTakeHomeProject
//
//  Created by Andres Vazquez on 2022-11-15.
//

import SwiftUI

struct DetailPersonScreen: View {
    let id: Int
    @ObservedObject private var vm = DetailPersonViewModel()
    
    var body: some View {
        List {
            if let avatarURL = vm.person?.data.avatar,
               let imageURL = URL(string: avatarURL) {
                FetchedImage(url: imageURL)
                    .frame(height: 250)
                    .listRowInsets(EdgeInsets(top: -20, leading: -20, bottom: -20, trailing: -20))
            }
            
            Section {
                VStack(alignment: .leading) {
                    Pill(id: 0)
                    InfoWithLabel(label: "First Name", value: vm.person?.data.firstName ?? "-")
                }
                
                InfoWithLabel(label: "Last Name", value: vm.person?.data.lastName ?? "-")
                InfoWithLabel(label: "Email", value: vm.person?.data.email ?? "-")
            }
            
            if let supportURLAsString = vm.person?.support.url,
               let supportURL = URL(string: supportURLAsString){
                Section {
                    InfoWithLabel(label: vm.person?.support.text ?? "-") {
                        Link(destination: supportURL) {
                            HStack {
                                Text(supportURLAsString)
                                Spacer()
                                Symbols.link
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Details")
        .onAppear {
            vm.fetchDetails(for: id)
        }
    }
}

struct DetailPersonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailPersonScreen(id: 1)
        }
    }
}
