//
//  DetailPersonViewModel.swift
//  iOSTakeHomeProject
//
//  Created by Andres Vazquez on 2022-11-17.
//

import Foundation

final class DetailPersonViewModel: ObservableObject {
    @Published private(set) var person: PersonResponse?
    
    // MARK: - Intents
    func fetchDetails(for id: Int) {
        Task {
            do {
                person = try await NetworkingManager.shared.request(Reqres.user(id), type: PersonResponse.self)
            } catch {
                print(error)
            }
        }
    }
}
