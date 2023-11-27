//
//  DirectoryModel.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import Foundation

struct DirectoryModel: Codable, Hashable, Identifiable {
    
    var id: String
    var name: String
    var slug: String?
    var websiteURL: String?
    var logo: String?
    var coverImage: String?
    var description: String?
    var phone: String?
    var email: String?
    var address: Address?
    var googleMapsURL: String?
    var rssFeedURL: [String]?
    var services: [String]?
    var socialProfiles: String?
    var isActive: Bool?
    
}

struct DirectoryList: Codable {
    var data: [DirectoryModel]
}

extension DirectoryModel {
    static let directory = [DirectoryModel(id: "1", name: "Veteran Owned Business"), DirectoryModel(id: "2", name: "Owned by Vets"), DirectoryModel(id: "3", name: "VetBiz Live"), DirectoryModel(id: "4", name: "Veterans Referring Veterans"), DirectoryModel(id: "5", name: "Veterans Business Network"), DirectoryModel(id: "6", name: "Veteran Owned Business Network"), DirectoryModel(id: "7", name: "VetFriends"), DirectoryModel(id: "8", name: "Buy Veteran")]
}

