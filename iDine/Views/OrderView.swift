//
//  OrderView.swift
//  iDine
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 02/09/2023.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("£\(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                Section {
                    NavigationLink("Place Order") {
                       CheckoutView()
                    }
                }
                // If there are no items, disable navigation to next page
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .listStyle(.insetGrouped)
            .toolbar {
                EditButton()
            }
        }
    }
    
    // A list view can be manipulated using IndexSet – a collection of locations in its data.
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
