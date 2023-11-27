//
//  VeteranDBApp.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import SwiftUI

@main
struct VeteranDBApp: App {
    
    @StateObject private var model: BusinessViewModel
    @StateObject private var directoryModel: DirectoryViewModel
    @StateObject private var nonprofitModel: NonprofitViewModel
    @StateObject private var podcastModel: PodcastViewModel
    
    init() {
        let apiService = APIService()
        _model = StateObject(wrappedValue: BusinessViewModel(apiService: apiService))
        _directoryModel = StateObject(wrappedValue: DirectoryViewModel(apiService: apiService))
        _nonprofitModel = StateObject(wrappedValue: NonprofitViewModel(apiService: apiService))
        _podcastModel = StateObject(wrappedValue: PodcastViewModel(apiService: apiService))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .environmentObject(directoryModel)
                .environmentObject(nonprofitModel)
                .environmentObject(podcastModel)
        }
    }
}
