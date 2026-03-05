import SwiftUI

struct Product: Identifiable{
    let id = UUID()
    let name: String
    let category: String
}

struct ContentView: View {
    
       
    @State private var products: [Product] = []
    @State private var showingAddProduct = false
    @State private var searchText = ""
    @State private var showingCalculator = false
    
    let categories = ["Food", "Cleaning Products", "Clothes"]
    
    let themeRed = Color(red: 248/255, green: 95/255, blue: 106/255)

    var body: some View {
        NavigationStack {
            List {
                ForEach(categories, id: \.self) { category in
                    Section(header: Text(category)){
                        ForEach(filteredProducts(in: category)) { product in
                            Text(product.name)
                        }
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
                AddProductsView(categories: categories) { name, category in
                    let newProduct = Product(name: name, category: category)
                    products.append(newProduct)
                }
            }
            .sheet(isPresented: $showingCalculator){
                CalculateView()
            } 
            
        }
    }
    
    
    func filteredProducts(in category: String) -> [Product] {
        products
            .filter { $0.category == category}
            .filter{
                searchText.isEmpty ||
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
    }
}

#Preview {
    ContentView()
}
