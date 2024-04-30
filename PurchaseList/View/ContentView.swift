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
    
    
    

    var body: some View {
        NavigationSplitView {
            VStack() {
//                TextField("Nouvel Article", text: $purchaseLabel)
//                    .textFieldStyle(.roundedBorder)
//                    .padding()
                //ContactForm(text: $purchaseLabel)
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
            .sheet(isPresented: $openView) {
                ContactForm(text: $purchaseLabel)
                    .presentationDetents([.fraction(0.40)])
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
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
