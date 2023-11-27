//
//  NonprofitView.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import SwiftUI

struct NonprofitView: View {
    
    @EnvironmentObject private var model: NonprofitViewModel
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(searchResults) { non in
                        NavigationLink {
                            NonprofitDetailView(nonprofit: non)
                        } label: {
                            NonprofitRowView(nonprofit: non)
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
            .navigationTitle("Non-Profits")
            .navigationBarTitleDisplayMode(.large)
        }
        .searchable(text: $searchText)
        .task {
            await getNonprofits()
        }
    }
    
    func getNonprofits() async {
        do {
            try await model.getNonprofits()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var searchResults: [NonprofitModel] {
        if searchText.isEmpty {
            return model.nonprofitList
        } else {
            return model.nonprofitList.filter { $0.name.contains(searchText) }
        }
    }
}

#Preview {
    NonprofitView()
        .environmentObject(NonprofitViewModel(apiService: APIService()))
}
