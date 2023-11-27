//
//  DirectoryView.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import SwiftUI

struct DirectoryView: View {
    
    @EnvironmentObject private var model: DirectoryViewModel
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(searchResults,  id: \.id) { dir in
                        VStack {
                            DirectoryRowView(directory: dir)
                        }
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
                .padding(.horizontal, 12)
                .navigationTitle("Directories")
                .navigationBarTitleDisplayMode(.large)

            }
        }
        .searchable(text: $searchText) {
            
        }
        .task {
            await getDirectories()
        }
    }
    
    func getDirectories() async {
        print("inside getDirectories")
        do {
            try await model.getDirectories()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var searchResults: [DirectoryModel] {
        if searchText.isEmpty {
            return model.directoryList
        } else {
            return model.directoryList.filter { $0.name.contains(searchText) }
        }
    }
}


#Preview {
    DirectoryView()
}
