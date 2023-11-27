//
//  DirectoryRowView.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import SwiftUI

struct DirectoryRowView: View {
    
    @State var directory: DirectoryModel
    
    var body: some View {
        VStack {
            Image("logo-green")
                .resizable()
                .scaledToFit()
                .padding(.bottom, 12)
            
            Text(directory.name)
            if directory.websiteURL != nil {
                let urlPrefix = "https://"
                let urlAddress = directory.websiteURL
                let fullUrl = urlPrefix + urlAddress!
                Link(directory.websiteURL!, destination: URL(string: fullUrl)!)
                    .foregroundStyle(Color.main)
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 10)
        .background(Color("TanColor"))
    }
}

#Preview {
    DirectoryRowView(directory: DirectoryModel.directory[1])
}
