//
//  ContentView.swift
//  APrice4Everything
//
//  Created by Wilfredo Camac on 8/02/24.
//

import SwiftUI

struct ContentView: View {
    let products = Bundle.main.decode("LP2023.json")
    @State private var searchedProduct: String = ""
    @State private var showingAddingSheet: Bool = false // Booleano que despliega el sheet.
    
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center) {
                TextField ("Search", text: $searchedProduct)
                    .padding(.all, 20.0)
                    .frame(width: 300.0, height: 40.0)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
                    .border(.red, width: 1)
                
                
                
                Button ("dame el mlfb") {
                    print(products[1])
                }
                .padding(.all, 10.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
                
                Text(searchedProduct)
                    .padding(.all, 10)
                    .border(.red, width: 1)
                Text("Texto de marcado list")
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(products){
                            if let unwrappedMlfb = $0.mlfb{Text(unwrappedMlfb)}
                        }
                        .padding(.all, 5)
                        .border(.red, width: 1)
                    }}}
            .navigationTitle("APrice4Everything").fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
            .toolbar {
                Button {
                    showingAddingSheet.toggle() // despliega el sheet de agregar nuevo producto.
                } label: {
                    Label("Add a new MLFB", systemImage: "plus").font(.largeTitle)
                }
            }
            
        }.sheet(isPresented: $showingAddingSheet) {
            AddingNewProduct()
        }
        
    }
}

#Preview {
    ContentView()
}


//.searchable(text: $viewModel.searchText, prompt: "Search for Meals")
