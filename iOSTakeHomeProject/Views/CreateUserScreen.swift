//
//  CreateUserScreen.swift
//  iOSTakeHomeProject
//
//  Created by Andres Vazquez on 2022-11-17.
//

import SwiftUI

struct CreateUserScreen: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var vm = CreateUserViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("First Name", text: $vm.person.firstName)
                TextField("Last Name", text: $vm.person.lastName)
                TextField("Job", text: $vm.person.job)
                
                Section {
                    Button("Submit") {
                        vm.createUser()
                    }
                }
            }
            .navigationTitle("Create")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
            .onChange(of: vm.createdUserSuccessfully) { successfulSubmit in
                if successfulSubmit == true {
                    dismiss()
                }
            }
        }
    }
}

struct CreateUserScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserScreen()
    }
}
