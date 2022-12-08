//
//  PeopleResponse.swift
//  iOSTakeHomeProject
//
//  Created by Andres Vazquez on 2022-11-14.
//

import Foundation

struct PeopleResponse: Codable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support
}
