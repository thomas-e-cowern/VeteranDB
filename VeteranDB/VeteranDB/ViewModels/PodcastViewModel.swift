//
//  PodcastViewModel.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import Foundation

@MainActor
class PodcastViewModel: ObservableObject {
    
    let apiService: APIService
    
    @Published var podcastList: [PodcastModel] = []
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getPodcasts() async throws {
        podcastList = try await apiService.getPodcasts()
    }
    
}

