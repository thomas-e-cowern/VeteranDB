//
//  APIService.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import Foundation

struct ResponseData: Codable {
    var data: [String: String]
}

enum NetworkError: Error {
    case badUrl
    case badRequest
    case decodingError
    case badId
}

class APIService {
    static let shared = APIService()
    enum APIError: Error {
        case error
    }
    
    func getAllBusiness() async throws -> [BusinessModel] {
        print("API getAllBusiness hit")
        
        var request = URLRequest(url: URL(string: Constants.API.businessURL)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let (data, response)  = try await URLSession.shared.data(for: request)
        print("response: \(response)")
        
        guard let businessList = try?  JSONDecoder().decode(BusinessList.self, from: data) else {
            print("trouble decoding businesses")
            throw NetworkError.decodingError
        }
        
        print("businessList: \(businessList.data)")
//
        return businessList.data
    }
    
    func getDirectories() async throws -> [DirectoryModel] {
        print("API getDirectores hit")
        
        var request = URLRequest(url: URL(string: Constants.API.directoryURL)!, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print("directory response: \(response)")
        
        guard let directoryList = try? JSONDecoder().decode(DirectoryList.self, from: data) else {
            print("trouble decoding directory")
            throw NetworkError.decodingError
        }
        
        print("directory list: \(directoryList.data)")
        
        return directoryList.data
    }
    
    func getNonprofits() async throws -> [NonprofitModel] {
        print("hit nonprofits")
        var request = URLRequest(url: URL(string: Constants.API.nonprofitURL)!, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
//        print("nonprofit response: \(response)")
        
        guard let nonprofitList = try? JSONDecoder().decode(NonprofitList.self, from: data) else {
            throw NetworkError.decodingError
        }
        
        print("nonprofit list: \(nonprofitList)")
        
        return nonprofitList.data
    }
    
    func getPodcasts() async throws -> [PodcastModel] {
        
        var request = URLRequest(url: URL(string: Constants.API.podcastURL)!, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        guard let podcastList = try? JSONDecoder().decode(PodcastList.self, from: data) else {
            throw NetworkError.decodingError
        }
        
        print("podcast list: \(podcastList)")
        
        return podcastList.data
                
    }
}

