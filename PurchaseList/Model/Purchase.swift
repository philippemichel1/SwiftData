//
//  Purchase.swift
//  PurchaseList
//
//  Created by Philippe MICHEL on 29/04/2024.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Purchase {
    var name:String
    var quantity:Int
    var alreadyBought:Bool
    
    init(name: String, quantity: Int, alreadyBought: Bool = false) {
        self.name = name
        self.quantity = quantity
        self.alreadyBought = alreadyBought
    }
}
