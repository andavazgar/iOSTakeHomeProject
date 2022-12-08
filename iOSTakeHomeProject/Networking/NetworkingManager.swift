//
//  NetworkingManager.swift
//  iOSTakeHomeProject
//
//  Created by Andres Vazquez on 2022-11-16.
//

import Foundation

final class NetworkingManager {
    static let shared = NetworkingManager()
    
    private init() {}
    
    func request<T: Decodable>(methodType: MethodType = .GET, _ url: String, type: T.Type) async throws -> T {
        guard let url = URL(string: url) else { throw NetworkingError.invalidURLString }
        
        let request = buildRequest(with: methodType, for: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkingError.invalidServerResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        
        return try decoder.decode(T.self, from: data)
    }
    
    func request(methodType: MethodType = .GET, _ url: String) async throws {
        guard let url = URL(string: url) else { throw NetworkingError.invalidURLString }
        
        let request = buildRequest(with: methodType, for: url)
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...300) ~= httpResponse.statusCode else {
            throw NetworkingError.invalidServerResponse
        }
    }
    
    private func buildRequest(with methodType: MethodType, for url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        
        switch methodType {
        case .GET:
            request.httpMethod = "GET"
        case .POST(let data):
            request.httpMethod = "POST"
            request.httpBody = data
        }
        
        return request
    }
}


extension NetworkingManager {
    enum NetworkingError: Error {
        case invalidURLString, invalidServerResponse
    }
    
    enum MethodType {
        case GET, POST(data: Data)
    }
}
