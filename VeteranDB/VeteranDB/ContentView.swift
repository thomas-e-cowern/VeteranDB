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
    
    @State private var isValid: Bool = false
    @State var isAuthenticated: Bool = false
    
    var body: some View {
        NavigationStack {
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
                    
                    isValid = LoginService().Login(email: email.lowercased(), password: password)
                    print(isValid)
                    if isValid {
                        isAuthenticated = true
                    }
                }
                .buttonStyle(.borderedProminent)
                
                
                
                Spacer()
            }
            .padding()
            .navigationDestination(isPresented: $isAuthenticated) {
                Text("You made it")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
