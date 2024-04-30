//
//  Quantity.swift
//  PurchaseList
//
//  Created by Philippe MICHEL on 29/04/2024.
//

import SwiftUI

struct Quantity: View {
    @Bindable var myQuantity:Purchase
    var body: some View {
        Stepper("\(myQuantity.quantity)", value: $myQuantity.quantity, in: 0...100,step: 1)
    }
}

//#Preview {
//    Quantity(myQuantity: <#Purchase#>)
//}
