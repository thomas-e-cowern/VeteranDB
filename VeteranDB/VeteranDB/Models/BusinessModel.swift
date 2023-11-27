//
//  BusinessModel.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import Foundation

struct BusinessModel: Codable, Hashable, Identifiable {
    
    var id: String? = ""
    var name: String? = ""
    var slug: String? = ""
    var websiteURL: String? = ""
    var logo: String? = ""
    var description: String? = ""
    var phone: String? = ""
    var email: String? = ""
    var address: Address?
    var industryCodeNAICS: [Int]?
    var socialProfiles: [String: String?]?
//    var services: [Services?]?
}

struct Address: Codable, Hashable {
    var zip: String? = ""
    var city: String? = ""
    var line1: String? = ""
    var line2: String? = ""
    var state: String? = ""
    var country: String? = ""
}

struct Services: Codable, Hashable {
    var name: String? = ""
    var price: String? = ""
    var pageURL: String? = ""
    var description: String? = ""
}

struct BusinessList: Codable {
    var data: [BusinessModel]
}

extension BusinessModel {
    static let businesses = [BusinessModel(id: "1", name: "Bob's Tacos", websiteURL: "www.yahoo.com", description: "Best tacos in bob land", email: "bob@bob.com", address: Address(zip: "45678", city: "Boston", line1: "454 Jefferson Ave", line2: "Suite 56", state: "Massachusetta", country: "USA")), BusinessModel(id: "2", name: "Car World", websiteURL: "www.yahoo.com", description: "Car deals for everyone", email: "tim@carworld.com", address: Address(zip: "45678", city: "New York", line1: "6789 Phillips Road", line2: "", state: "NY", country: "USA"))]
}

