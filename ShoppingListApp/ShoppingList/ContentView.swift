import SwiftUI

struct ContentView: View {
    
    @State private var products = ["Food 1", "Food 2", "Food 3", "Food 4", "Food 5"]
    @State private var cleaningProducts = ["Product 1", "Product 2", "Product 3", "Product 4", "Product 5"]
    @State private var drinks = ["Drink 1", "Drink 2", "Drink 3", "Drink 4", "Drink 5"]
    @State private var showingAddProduct = false
    @State private var searchText = ""
    @State private var showingCalculator = false
    
    let themeRed = Color(red: 248/255, green: 95/255, blue: 106/255)

    var body: some View {
        NavigationStack {
            List {
                
                Section(header: Text("Food")) {
                    ForEach(filteredItems(products), id: \.self) { item in
                        Text(item)
                    }
                }
                
                Section(header: Text("Cleaning Products")) {
                    ForEach(filteredItems(cleaningProducts), id: \.self) { item in
                        Text(item)
                    }
                }

                Section(header: Text("Drinks")) {
                    ForEach(filteredItems(drinks), id: \.self) { item in
                        Text(item)
                    }
                }
            }
                        .navigationTitle("Products")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "Search Products")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Calculator") {
                        showingCalculator = true
                    }
                    .foregroundColor(themeRed)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                         showingAddProduct = true
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(themeRed)
                    }
                }
            }
            .sheet(isPresented: $showingAddProduct){
                AddProductsView()
            }
            .sheet(isPresented: $showingCalculator){
                CalculateView()
            } 
            
        }
    }
    
    
    func filteredItems(_ list: [String]) -> [String] {
        if searchText.isEmpty {
            return list
        } else {
            return list.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
