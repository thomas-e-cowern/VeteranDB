//
//  PodcastRowView.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import SwiftUI

struct PodcastRowView: View {
    
    @State var podcast: PodcastModel
    
    var body: some View {
        VStack {
            Image("logo-green")
                .resizable()
                .scaledToFit()
                .padding(.bottom, 24)
            
            Text(podcast.name)
                .font(.title3)
                .foregroundStyle(Color.main)
        }
        
        .padding(.horizontal, 24)
        .padding(.vertical, 10)
        .background(Color("TanColor"))
    }
}

#Preview {
    PodcastRowView(podcast: PodcastModel.podcasts[0])
}
