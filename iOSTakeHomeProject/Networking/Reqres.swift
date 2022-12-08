//
//  Reqres.swift
//  iOSTakeHomeProject
//
//  Created by Andres Vazquez on 2022-11-17.
//

import Foundation

enum Reqres {
    static let baseURL = "https://reqres.in"
    static let users = "\(baseURL)/api/users"
    static var user: (Int) -> String = { "\(baseURL)/api/users/\($0)" }
}
