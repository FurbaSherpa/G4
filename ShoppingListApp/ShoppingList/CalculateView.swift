//
//  CalculateView.swift
//  ShoppingList
//
//  Created by Tech on 2026-01-30.
//

import SwiftUI

struct CalculateView: View {

    @Environment(\.dismiss) var dismiss

    @State private var price: String = ""
    @State private var result: String = ""

    let themeRed = Color(red: 248/255, green: 95/255, blue: 106/255)
    let taxRate = 0.13

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {

            Button(action: { dismiss() }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(themeRed)
                    .font(.title2)
            }
            .padding(.top)

            Text("Tax Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.3))

            VStack(alignment: .leading, spacing: 8) {
                Text("Price")
                    .foregroundColor(themeRed)
                    .fontWeight(.semibold)

                TextField("Enter price here", text: $price)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(PlainTextFieldStyle())

                Divider()
            }

            Button(action: {

                if let value = Double(price) {
                    let total = value + (value * taxRate)
                    result = String(format: "Total: $%.2f", total)
                } else {
                    result = "Enter valid price"
                }

            }) {
                Text("Calculate Tax")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(themeRed)
                    .cornerRadius(10)
            }

            if !result.isEmpty {
                Text(result)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.top)
            }

            Spacer()
        }
        .padding(.horizontal, 25)
        .navigationBarHidden(true)
    }
}

struct CalculateView_Previews: PreviewProvider {
    static var previews: some View {
        CalculateView()
    }
}
