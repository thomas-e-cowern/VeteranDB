//
//  ContentView.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 5/18/23.
//

import SwiftUI

struct ContentView: View {
    
    let apiKey = (Bundle.main.infoDictionary?["API_KEY"] as? String)!
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(apiKey)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
