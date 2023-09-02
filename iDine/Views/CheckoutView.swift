//
//  CheckoutView.swift
//  iDine
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 02/09/2023.
//

import SwiftUI

struct CheckoutView: View {
    
    // data that is external
    @EnvironmentObject var order: Order
    @State private var paymentType: String = "Credit Card"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    
    
    let paymentTypes = [ "Credit Card", "iDine Points", "Cash"]
    // local, simple value for current view
    
    let tipAmounts = [10, 15, 20, 25, 0]
   
    private var totalPrice: String {
        let total = Double(order.total)
        let tipValue = Double(tipAmount) * total / 100
        return (total + tipValue).formatted(.currency(code: "GBP"))
    }
    
    var body: some View {
        Form {
            Section {
                // two way binding by using $
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id:\.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter iDine ID", text: $loyaltyNumber)
                }
            }
            Section("Add a tip?") {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(tipAmounts, id:\.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total: \(totalPrice)") {
                Button("Confirm Order") {
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order confirmed", isPresented: $showingPaymentAlert) {
            
        } message: {
            Text("Your total was \(totalPrice)")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
