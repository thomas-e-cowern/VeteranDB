//
//  NonprofitModel.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import Foundation

struct NonprofitModel: Codable, Hashable, Identifiable {
    
    var id: String
    var name: String
    var slug: String?
    var websiteUrl: String?
    var logo: String?
    var coverImage: String?
    var description: String?
    var phone: String?
    var email: String?
    var address: Address?
    var googleMapsURL: String?
    var rssFeedURL: [String]?
    var industryCodeNAICS: [Int]?
    var socialProfiles: [String: String?]?
    var isActive: Bool?
}

struct NonprofitList: Codable {
    var data: [NonprofitModel]
}

extension NonprofitModel {
    static let nonprofit = [NonprofitModel(id: "1", name: "Non Profit 1", slug: "Non profit 1 slug", phone: "1234567890", email: "hello@nonprofit.com", address: Address(zip: "12345", city: "Miami", line1: "1234 main street", state: "Florida", country: "USA")), NonprofitModel(id: "2", name: "Non Profit 2", slug: "Non profit 2 slug", phone: "1234567890", email: "hello@nonprofit.com", address: Address(zip: "12345", city: "Miami", line1: "1234 main street", state: "Florida", country: "USA"))]
}

