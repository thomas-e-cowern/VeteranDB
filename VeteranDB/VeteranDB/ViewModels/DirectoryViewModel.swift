//
//  DirectoryViewModel.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import Foundation

@MainActor
class DirectoryViewModel: ObservableObject {
    
    let apiService: APIService
    
    @Published var directoryList: [DirectoryModel] = []
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getDirectories() async throws {
        directoryList = try await apiService.getDirectories()
        print("Directory list: \(directoryList)")
    }
}
