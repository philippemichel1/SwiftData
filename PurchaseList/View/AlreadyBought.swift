//
//  AlreadyBought.swift
//  PurchaseList
//
//  Created by Philippe MICHEL on 29/04/2024.

import SwiftUI

struct AlreadyBought: View {
    @Bindable var alreadyBought:Purchase
    var body: some View {
        HStack {
            Toggle(alreadyBought.name, isOn: $alreadyBought.alreadyBought)
                .tint(.accentColor)
        }
    }
}

#Preview {
    AlreadyBought(alreadyBought:Purchase(name: "name"))
}
