//
//  ContactForm.swift
//  PurchaseList
//
//  Created by Philippe MICHEL on 30/04/2024.
//

import SwiftUI

struct ContactForm: View {
    @Environment(\.dismiss) var dismiss
    @Binding var text:String
    var body: some View {
        NavigationStack {
            Form {
                    Section("Ajouter article") {
                        TextField("Nouvel Article", text: $text)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                    }
                }
            Button {
                //self.addItem()
            } label: {
                Text("Valider ")
                    .buttonStyle(PlainButtonStyle())
                    
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { dismiss()
                        
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                    })
                }
            }
        }
        
    }
}

#Preview {
    ContactForm(text: .constant("Carottes"))
}
