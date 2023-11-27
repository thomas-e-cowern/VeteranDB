//
//  BusinessViewModel.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import Foundation

@MainActor
class BusinessViewModel: ObservableObject {
    
    let apiService: APIService
    
    @Published var businessList: [BusinessModel] = []
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getAllBusinesses() async throws {
        do {
            businessList = try await apiService.getAllBusiness()
            print("businessList in BVM: \(businessList)")
        } catch {
            print(error.localizedDescription)
        }
    }
}

