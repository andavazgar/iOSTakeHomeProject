//
//  User.swift
//  iOSTakeHomeProject
//
//  Created by Andres Vazquez on 2022-11-14.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let avatar: String
}
