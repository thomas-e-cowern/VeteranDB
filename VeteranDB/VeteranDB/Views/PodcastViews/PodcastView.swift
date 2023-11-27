//
//  PodcastView.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import SwiftUI

struct PodcastView: View {
    
    @EnvironmentObject private var model: PodcastViewModel
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(searchResults) { podcast in
                        NavigationLink {
                            PodcastDetailView(podcast: podcast)
                        } label: {
                            PodcastRowView(podcast: podcast)
                        }
                    }
                    .listRowSeparator(.visible)
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 5)
                            .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
                    )
                    .overlay(RoundedRectangle(cornerRadius: 16)
                        .stroke(.green, lineWidth: 1))
                }
                .padding(.horizontal, 12)
            }
            .navigationTitle("Podcasts")
            .navigationBarTitleDisplayMode(.large)
        }
        .background(Color.accentColor)
        .searchable(text: $searchText)
        .task {
            await getPodcasts()
        }
        
    }
    
    func getPodcasts() async {
        do {
            try await model.getPodcasts()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var searchResults: [PodcastModel] {
        if searchText.isEmpty {
            return model.podcastList
        } else {
            return model.podcastList.filter { $0.name.contains(searchText) }
        }
    }
}

#Preview {
    PodcastView()
        .environmentObject(PodcastViewModel(apiService: APIService()))
}

