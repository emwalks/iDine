//
//  ItemRow.swift
//  iDine
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 02/09/2023.
//

import SwiftUI

struct ItemRow: View {
    
    var item: MenuItem
    
    let colours: [String: Color] = ["D": .purple,
                                    "G": .black,
                                    "N": .red,
                                    "S": .blue,
                                    "V": .green]
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 2))
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("£\(item.price)")
            }
            Spacer()

            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colours[restriction, default: .gray])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
            
            
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
