//
//  ContentView.swift
//  PurchaseList
//
//  Created by Philippe MICHEL on 29/04/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Purchase]
    @State private var purchaseLabel:String = ""
    @State private var openView:Bool = false
    @State private var save:Bool = false
    
    
    

    var body: some View {
        NavigationSplitView {
            VStack() {
                Button("Article") {self.openView.toggle()}
            }
            
            List {
                ForEach(items) { item in
                    HStack {
                        Quantity(myQuantity: item)
                        AlreadyBought(alreadyBought: item)
                    }
                   
                }
                .onDelete(perform: deleteItems)
            }
            // affiche la fenetre sheet
            .sheet(isPresented: $openView) {
                ContactForm(text: $purchaseLabel, validated: $save)
                    .presentationDetents([.fraction(0.40)])
            }
            // appel la fonction de sauvegarde
            .onChange(of: save) {
                if save == true {
                    addItem()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            if !purchaseLabel.isEmpty {
                let newItem = Purchase(name: purchaseLabel)
                modelContext.insert(newItem)
                purchaseLabel = ""
                save = false
                
            }
            
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
}
