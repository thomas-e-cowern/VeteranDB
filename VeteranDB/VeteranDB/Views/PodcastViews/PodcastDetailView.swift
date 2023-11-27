//
//  PodcastDetailView.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import SwiftUI


var rssUrls: [String] = ["https://anchor.fm/s/2429b0c/podcast/rss", "https://anchor.fm/s/26fdf860/podcast/rss"]

struct PodcastDetailView: View {
    
    var podcast: PodcastModel

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: Constants.API.businessLogo + (podcast.logo ?? ""))) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .padding(0)
                    } else if phase.error != nil {
                        Image("bg-horizontal-cream")
                            .resizable()
                            .scaledToFill()
                    } else {
                        ProgressView()
                    }
                }
                
                Text(podcast.name)
                    .font(.title)
                    .padding(.bottom, 12)
                
                if let address = podcast.address {
                    AddressView(address: address)
                        .padding(.bottom, 12)
                } else {
                    Text("No Address")
                        .padding(.bottom, 12)
                }
                
                if let description = podcast.description {
                    Text(description)
                        .padding(.bottom, 12)
                        .padding(.horizontal, 12)
                }
                
                VStack {
                    Text("Contact Info:")
                    if let email = podcast.email {
                        Text(email)
                    } else {
                        Text("No email available")
                    }
                    
                    if let phone = podcast.phone {
                        Text(phone)
                    } else {
                        Text("No phone available")
                    }
                }
                
                VStack {
                    if let validFeeds = podcast.rssFeedURL {
                        Text("RSS Feeds:")
                            .padding(.vertical, 10)
                        if validFeeds.count > 0 {
                            ForEach(validFeeds, id: \.self) { url in
                                Link(url, destination: URL(string: url)!)
                            }
                        }
                    }
                }
                .background(Color.white)
                
                VStack {
                    if let validSocialProfiles = podcast.socialProfiles?.sorted(by: { $0.key < $1.key }).filter({$1 != nil}) {
                        if validSocialProfiles.count > 0 {
                            Text("Social Media:")
                                .padding(.vertical, 10)
                            HStack  (alignment: .center) {
                                ForEach(validSocialProfiles, id: \.key) { key, value in
                                    if value != nil {
                                        Link(destination: URL(string: value ?? "")!) {
                                            Image("\(key)")
                                        }
                                    }
                                }
                            }
                            .foregroundStyle(Color.main)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color("TanColor"))
    }
    
}

#Preview {
    PodcastDetailView(podcast: PodcastModel.podcasts[0])
}
