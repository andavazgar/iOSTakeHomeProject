//
//  StaticJSONMapper.swift
//  iOSTakeHomeProject
//
//  Created by Andres Vazquez on 2022-11-14.
//

import Foundation

struct StaticJSONMapper {
    static func decodeFile<T: Decodable>(named name: String, into type: T.Type) throws -> T {
        guard let filePath = Bundle.main.path(forResource: name, ofType: "json") else {
            throw StaticJSONMapperErrors.InvalidFileName
        }
        guard let jsonData = FileManager.default.contents(atPath: filePath) else {
            throw StaticJSONMapperErrors.FailedToGetContentsOfFile
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        
        return try decoder.decode(T.self, from: jsonData)
    }
}


extension StaticJSONMapper {
    enum StaticJSONMapperErrors: Error {
        case InvalidFileName, FailedToGetContentsOfFile
    }
    
    static var previewUser: PersonResponse {
        let response = try! StaticJSONMapper.decodeFile(named: "User", into: PersonResponse.self)
        return response
    }
}
