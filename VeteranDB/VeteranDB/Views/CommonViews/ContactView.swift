//
//  ContactView.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/19/23.
//

import SwiftUI

struct ContactView: View {
    
//    var business: BusinessModel
    var email: String?
    var phone: String?
    var url: String?
    
    var body: some View {
        VStack {
            Text("Contact Info:")
            if let email = email {
                HStack {
                    Image(systemName: "envelope")
                    Link("\(email)", destination: URL(string: "mailto:\(email)")!)
                }
            } else {
                Text("No email available")
            }
            
            if let phone = phone {
                HStack {
                    Image(systemName: "iphone.gen1")
                    Link("\(phone)", destination: URL(string: "tel:\(phone)")!)
                }
                
            } else {
                Text("No phone available")
            }
            
            if url != nil {
                HStack {
                    Image(systemName: "network")
                    let urlPrefix = "https://"
                    let urlAddress = url
                    let fullUrl = urlPrefix + urlAddress!
                    Link(url!, destination: URL(string: fullUrl)!)
                }
                
            }
        }
        .foregroundStyle(Color.main)
    }
}

#Preview {
    ContactView()
}
