//
//  PeopleViewModel.swift
//  iOSTakeHomeProject
//
//  Created by Andres Vazquez on 2022-11-17.
//

import Foundation

final class PeopleViewModel: ObservableObject {
    @Published private(set) var people = [User]()
    
    // MARK: - Intentions
    func fetchUsers() {
        Task {
            do {
                let response = try await NetworkingManager.shared.request(Reqres.users, type: PeopleResponse.self)
                
                DispatchQueue.main.async { [weak self] in
                    self?.people = response.data
                }
            } catch {
                print(error)
            }
        }
    }
}
