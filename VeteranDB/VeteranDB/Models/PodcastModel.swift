//
//  PodcastModel.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import Foundation

struct PodcastModel: Codable, Hashable, Identifiable {
    
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
    var rssFeedURL: [String]?
    var socialProfiles: [String: String?]?
    var isActive: Bool?
    
}

struct PodcastList: Codable {
    var data: [PodcastModel]
}

extension PodcastModel {
    static let podcasts = [PodcastModel(id: "1", name: "Podcast 1", websiteUrl: "www.website.com", email: "hello@podcast1.com", rssFeedURL: ["https://anchor.fm/s/2429b0c/podcast/rss"], socialProfiles: ["twitter":"https://twitter.com/battlebudpod", "youtube": "https://www.youtube.com/channel/uc6o1mwnxttazco5tpht-8zg"])]
}

