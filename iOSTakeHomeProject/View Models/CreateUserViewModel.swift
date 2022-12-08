//
//  CreateUserViewModel.swift
//  iOSTakeHomeProject
//
//  Created by Andres Vazquez on 2022-11-19.
//

import Foundation

final class CreateUserViewModel: ObservableObject {
    @Published var person = NewPerson()
    @Published private(set) var createdUserSuccessfully: Bool?
    
    func createUser() {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        if let data = try? encoder.encode(person) {
            Task {
                do {
                    try await NetworkingManager.shared.request(methodType: .POST(data: data), Reqres.users)
                    createdUserSuccessfully = true
                } catch {
                    print(error)
                    createdUserSuccessfully = false
                }
            }
        }
    }
}
