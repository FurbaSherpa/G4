//
//  AddProductsView.swift
//  ShoppingList
//
//  Created by Tech on 2026-02-05.
//

import SwiftUI

struct AddProductsView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var productName: String = ""
    @State private var selectedCategory: String = ""
    
    let themeRed = Color(red: 248/255, green: 95/255, blue: 106/255)
    
    
    let categories = ["Food", "Cleaning Products", "Drinks"]
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 30) {
                
                Button(action: { dismiss() }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(themeRed)
                        .font(.title2)
                }
                .padding(.top)
                
                Text("Add Product")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.3))
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Name")
                        .foregroundColor(themeRed)
                        .fontWeight(.semibold)
                    TextField("Enter Product name here", text: $productName)
                        .textFieldStyle(PlainTextFieldStyle())
                    Divider()
                }
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Category")
                        .foregroundColor(themeRed)
                        .fontWeight(.semibold)
                    
                    
                    Menu {
                        ForEach(categories, id: \.self) { cat in
                            Button(cat) {
                                selectedCategory = cat
                            }
                        }
                    } label: {
                        HStack {
                            Text(selectedCategory.isEmpty ? "Choose a category" : selectedCategory)
                                .foregroundColor(selectedCategory.isEmpty ? .gray.opacity(0.6) : .black)
                            
                            Spacer()
                            
                            
                            Image(systemName: "arrowtriangle.down.fill")
                                .resizable()
                                .frame(width: 12, height: 10)
                                .foregroundColor(.black)
                        }
                    }
                    Divider()
                }
                
                Spacer()
                
                
                VStack(spacing: 15) {
                    Button(action: {
                        
                        dismiss()
                    }) {
                        Text("Add Product")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(themeRed)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: AddCategoryView()) {
                        Text("Add new Category")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(themeRed)
                            .cornerRadius(10)
                    }
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 25)
            .navigationBarHidden(true)
        }
    }}

struct AddProducts_Preview: PreviewProvider {
    static var previews: some View {
        AddProductsView()
    }
}
