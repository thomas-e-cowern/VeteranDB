//
//  AddressView.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import SwiftUI

struct AddressView: View {
    
    var address: Address
    
    var body: some View {
        VStack {
            if (address.line1 != nil) {
                Image(systemName: "mappin.circle")
                Text(address.line1 ?? "")
            }
            
            if (address.line2 != nil && address.line2 != "") {
                Text(address.line2 ?? "")
            } else {
                
            }
            
            HStack {
                Text(address.city ?? "")
                Text(address.state ?? "")
                Text(address.zip ?? "")
            }
            
            Text(address.country ?? "")
        }
    }
}


#Preview {
    AddressView(address: Address(zip: "12345", city: "West Palm Beach", line1: "123 Main St", line2: "Apt 123", state: "FL", country: "USA"))
}
