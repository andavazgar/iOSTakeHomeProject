//
//  PeopleScreen.swift
//  iOSTakeHomeProject
//
//  Created by Andres Vazquez on 2022-11-14.
//

import SwiftUI

struct PeopleScreen: View {
    @ObservedObject private var vm = PeopleViewModel()
    @State private var showCreateUserScreen = false
    
    var body: some View {
        let columns = Array(repeating: GridItem(.flexible()), count: 2)
        
        NavigationView {
            ZStack {
                Theme.background.ignoresSafeArea()
                
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(vm.people) { person in
                            NavigationLink {
                                DetailPersonScreen(id: person.id)
                            } label: {
                                PersonItemView(person: person)
                            }
                        }
                    }
                    .navigationTitle("People")
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            createUserBtn
                        }
                    }
                    .padding()
                    .onAppear {
                        vm.fetchUsers()
                    }
                }
            }
        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleScreen()
    }
}

private extension PeopleScreen {
    var createUserBtn: some View {
        Button {
            showCreateUserScreen = true
        } label: {
            Symbols.createUser
        }
        .sheet(isPresented: $showCreateUserScreen) {
            CreateUserScreen()
        }
    }
}
