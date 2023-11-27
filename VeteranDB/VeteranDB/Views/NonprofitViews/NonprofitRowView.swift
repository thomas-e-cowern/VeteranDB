//
//  NonprofitRowView.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import SwiftUI

struct NonprofitRowView: View {
    
    @State var nonprofit: NonprofitModel
    
    var body: some View {
        VStack {
            Image("logo-green")
                .resizable()
                .scaledToFit()
                .padding(.bottom, 24)
            
            Text(nonprofit.name)
                .font(.title3)
                .foregroundStyle(Color.main)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 10)
        .background(Color("TanColor"))
    }
}

#Preview {
    NonprofitRowView(nonprofit: NonprofitModel.nonprofit[1])
}
