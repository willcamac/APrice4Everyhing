//
//  ContentView.swift
//  APrice4Everything
//
//  Created by Wilfredo Camac on 8/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var products = Bundle.main.decode("LP2023.json")
    @State private var searchedProduct: String = ""
    @State private var showingAddingSheet: Bool = false // Booleano que despliega el sheet.
    @State private var filteredProducts: [Product] = []
    
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center) {
                
                Button ("cantidad de productos") {
                    print(products[1])
                    print(products.count)
                }
                .padding(.all, 10.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
                
                Text(searchedProduct)
                    .padding(.all, 10)
                    .border(.red, width: 1)
                Text("Texto de marcado list")
               List {
                    LazyVStack(spacing: 10) {
                        ForEach(filteredProducts){
                            if let unwrappedMlfb = $0.mlfb{
                                
                                Text(unwrappedMlfb)
                            }
                        }
                        .border(.red, width: 1)
                    }
                }
                

       
                
            }.sheet(isPresented: $showingAddingSheet) {
                AddingNewProduct(products: $products)
            }
            .navigationTitle("APrice4Everything").fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
            .onAppear(perform: {filteredProducts = products})
            .searchable(text: $searchedProduct)
            .onChange(of: searchedProduct) { oldValue, newValue in
                filteredProducts = products.filter({ product in
                    guard let unwrappedMlfb = product.mlfb  else {
                        print("There was a error unwrapping mlfb")
                        return false}
                    if unwrappedMlfb.starts(with: newValue.uppercased()){
                        return true}
                    else {return false}
                    
                })
            }
            .toolbar {
                Button {
                    showingAddingSheet.toggle() // despliega el sheet de agregar nuevo producto.
                } label: {
                    Label("Add a new MLFB", systemImage: "plus").font(.largeTitle)
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}


//.searchable(text: $viewModel.searchText, prompt: "Search for Meals")
