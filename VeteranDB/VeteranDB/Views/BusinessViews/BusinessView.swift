//
//  BusinessView.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import SwiftUI

struct BusinessView: View {
    
    @EnvironmentObject private var model: BusinessViewModel
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading) {
                    ForEach(searchResults) { bus in
                        NavigationLink {
                            BusinessDetailView(business: bus)
                        } label: {
                            BusinessRowView(business: bus)
                        }
                        .frame(maxWidth: .infinity)
                        .listRowSeparator(.visible)
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 5)
                                .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
                        )
                        .overlay(RoundedRectangle(cornerRadius: 16)
                            .stroke(.green, lineWidth: 1))
                    }
                    .frame(maxWidth: .infinity)
                }
                .task {
                    await getList()
                }
                .navigationTitle("Business")
                .navigationBarTitleDisplayMode(.large)
                
            }
        }
        .searchable(text: $searchText) {
            
        }
    }
    
    func getList() async {
        print("inside getList")
        do {
            try await model.getAllBusinesses()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var searchResults: [BusinessModel] {
        if searchText.isEmpty {
            return model.businessList
        } else {
            return model.businessList.filter { $0.name!.contains(searchText) }
        }
    }
    
}

#Preview {
    BusinessView()
}
