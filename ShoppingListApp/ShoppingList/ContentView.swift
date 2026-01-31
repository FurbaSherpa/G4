//
//  ContentView.swift
//  ShoppingList
//
//  Created by Tech on 2026-01-30.
//

import SwiftUI

struct ContentView: View {
    
    var products = ["Food 1", "Food 2", "Food 3", "Food 4", "Food 5"]
    var Cleaningproducts = ["Product 1", "Product2", "Product 3", "Product 4", "Product 5"]
    
    var body: some View {
        VStack{
            
            //Title
            Text("Shopping List")
                .font(.title)
                .fontWeight(.heavy)
                
            //Calculate Button
            Button(action: {
                
            }){
                Text("Calculate")
                    .fontWeight(.semibold)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                Spacer()
            }
            
            //Add Button
            Button(action: {
                
            }){
                Text("Add")
                    .fontWeight(.semibold)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            
            
            Text("Groceries")
                .fontWeight(.semibold)
            //List of Products
            List(products, id: \.self) { i in
                //Each row
                Text(i)
            }
            
            Text("Cleaning Products")
                .fontWeight(.semibold)
            //List of Cleaning Products
            List(Cleaningproducts, id: \.self) { i in
                //Each row
                Text(i)
            }
            
            
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
