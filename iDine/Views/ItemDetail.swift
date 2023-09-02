//
//  ItemDetail.swift
//  iDine
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 02/09/2023.
//

import SwiftUI

struct ItemDetail: View {
    
    // @EnvironmentObject allows this variable not to have a value in code, because we’re saying it will already be set in the environment.
    // but also tells SwiftUI to watch the object for any changes and refresh its UI when a change announcement comes through.
    @EnvironmentObject var order: Order
    
    let item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()

                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.gray)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
                
            }
            Text(item.description)
                .padding()
            
            Button("Order This") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
