//
//  ContentView.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            TabView {
                BusinessView()
                    .tabItem {
                        Label("Business", systemImage: "bag")
                    }
                DirectoryView()
                    .tabItem {
                        Label("Directory", systemImage: "list.dash")
                    }
                NonprofitView()
                    .tabItem {
                        Label("Non Profit", systemImage: "heart.circle")
                    }
                PodcastView()
                    .tabItem {
                        Label("Podcast", systemImage: "ipod")
                    }
            }
            .padding()
            .background(Color.main)
        }
    }
}

#Preview {
    ContentView()
}
