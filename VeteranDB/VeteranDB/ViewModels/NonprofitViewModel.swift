//
//  NonprofitViewModel.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import Foundation

@MainActor
class NonprofitViewModel: ObservableObject {
    
    let apiService: APIService
    
    @Published var nonprofitList: [NonprofitModel] = []
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getNonprofits() async throws {
        nonprofitList = try await apiService.getNonprofits()
    }
    
}
