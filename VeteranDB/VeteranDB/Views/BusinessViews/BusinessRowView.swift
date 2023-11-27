//
//  BusinessRowView.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import SwiftUI

struct BusinessRowView: View {
    
    @State var business: BusinessModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: Constants.API.businessLogo + (business.logo ?? ""))) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                } else if phase.error != nil {
                    Image("logo-green")
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom, 12)
                } else {
                    ProgressView()
                        .frame(width: 100, height: 100)
                        .background(Color("TanColor"))                }
            }
            
                Text(business.name ?? "")
                    .foregroundStyle(Color.main)
 
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 24)
            .padding(.vertical, 10)
            .background(Color("TanColor"))
    }
}

#Preview {
    BusinessRowView(business: BusinessModel.businesses[0])
}
