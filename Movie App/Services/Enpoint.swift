//
//  Enpoint.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 13.10.2024.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

enum Endpoint {
    case popular
}

protocol EndpointProtocol {
    var baseUrl: String { get }
    var genreUrl: String { get }
    var apiKey: String { get }
    var method: HTTPMethods { get }
    
    func movieAppUrl() -> String
    func request() -> URLRequest
}

extension Endpoint: EndpointProtocol {
    var baseUrl: String {
        return "https://api.themoviedb.org/3/movie/"
    }
    
    var genreUrl: String {
        switch self {
        case .popular:
            return "popular"
        }
    }
    
    var apiKey: String {
        return "?api_key=ea695df68f3043569a92a34c7fc859ad"
    }
    
    var method: HTTPMethods {
        switch self {
        case .popular:
            return .get
        }
    }
    
    func movieAppUrl() -> String {
        return "\(baseUrl)\(genreUrl)\(apiKey)"
    }
    
    func request() -> URLRequest {
        guard let apiUrl = URLComponents(string: movieAppUrl()) else {
            fatalError("")
        }
        
        guard let url = apiUrl.url else {
            fatalError("")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
}


