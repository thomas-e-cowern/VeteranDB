//
//  NonprofitDetailView.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import SwiftUI

struct NonprofitDetailView: View {
    
    var nonprofit: NonprofitModel
    
    var body: some View {
        
        ScrollView {
           
            VStack {
                
                AsyncImage(url: URL(string: Constants.API.businessLogo + (nonprofit.logo ?? ""))) { phase in
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
                
                Text(nonprofit.name)
                    .font(.title)
                    .padding(.bottom, 12)
                
                if let address = nonprofit.address {
                    AddressView(address: address)
                        .padding(.bottom, 12)
                } else {
                    Text("No Address")
                        .padding(.bottom, 12)
                }
                
                ContactView(email: nonprofit.email, phone: nonprofit.phone, url: nonprofit.websiteUrl)
                
                if let description = nonprofit.description {
                    Text(description)
                        .padding(.bottom, 12)
                        .padding(.horizontal, 12)
                }
                
                VStack {
                    VStack {
                        if let industryCodeNAICS = nonprofit.industryCodeNAICS {
                            if industryCodeNAICS.count > 0 {
                                Text("NAICS:")
                                    .padding(.vertical, 10)
                                HStack {
                                    ForEach(industryCodeNAICS, id: \.self) { naic in
                                        Text("\(naic, format: .number.grouping(.never))")
                                    }
                                }
                            }
                        }
                    }
                    
                    VStack {
                        if let validSocialProfiles = nonprofit.socialProfiles?.sorted(by: { $0.key < $1.key }).filter({$1 != nil}) {
                            
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
        }
        .frame(maxWidth: .infinity)
        .background(Color("TanColor"))
        
    }
}

#Preview {
    NonprofitDetailView(nonprofit: NonprofitModel.nonprofit[0])
}
