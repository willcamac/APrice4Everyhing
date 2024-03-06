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
                
                Button ("dame el mlfb") {
                    print(products[1])
                    print(products.count)
                }
                .padding(.all, 10.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
                
                Text(searchedProduct)
                    .padding(.all, 10)
                    .border(.red, width: 1)
                Text("Texto de marcado list")
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(filteredProducts){
                            if let unwrappedMlfb = $0.mlfb{Text(unwrappedMlfb)}
                        }
                        .padding(.all, 5)
                        .border(.red, width: 1)
                        .searchable(text: $searchedProduct)
                        //                        .onCha
                        .onChange(of: searchedProduct) { oldValue, newValue in
                            //                            filteredProducts = products.filter({ $0.mlfb!.starts(with: search.uppercased())})}
                            filteredProducts = products.filter({ product in
                                if let unwrappedMlfb = product.mlfb{
                                    unwrappedMlfb.starts(with: unwrappedMlfb.uppercased())
                                return true}
                            return false})
                            
                        }}}
                
                
                .navigationTitle("APrice4Everything").fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
                .onAppear(perform: {
                    filteredProducts = products
                })
                .toolbar {
                    Button {
                        showingAddingSheet.toggle() // despliega el sheet de agregar nuevo producto.
                    } label: {
                        Label("Add a new MLFB", systemImage: "plus").font(.largeTitle)
                    }
                }
                
            }.sheet(isPresented: $showingAddingSheet) {
                AddingNewProduct(allProducts: $products)
            }
            
        }
    }
}

#Preview {
    ContentView()
}


//.searchable(text: $viewModel.searchText, prompt: "Search for Meals")
