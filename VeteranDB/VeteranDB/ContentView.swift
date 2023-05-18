//
//  ContentView.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 5/18/23.
//

import SwiftUI

struct ContentView: View {
    
    let apiKey = (Bundle.main.infoDictionary?["API_KEY"] as? String)!
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Image("logo-green")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            Text("Login")
                .font(.title)

            VStack {
                TextField("Email", text: $email)
                    .textCase(.lowercase)
                TextField("Password", text: $password)
            }
            .textFieldStyle(.roundedBorder)
            .padding()

            Button("Login") {
                
                LoginService().Login(email: email.lowercased(), password: password)
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
