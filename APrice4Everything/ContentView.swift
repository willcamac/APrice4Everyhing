//
//  ContentView.swift
//  APrice4Everything
//
//  Created by Wilfredo Camac on 8/02/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var model: ProductModel
    @State private var searchedProductText: String = ""
    @State private var showingAddingSheet: Bool = false // Booleano que despliega el sheet.

    var searchResults: [Product] {
        if searchedProductText.isEmpty {
            return model.productList
        } else {
            return model.productList.filter { $0.mlfb?.contains(searchedProductText) ?? false || $0.descripcion?.contains(searchedProductText) ?? false
            }
        }
    }

    var body: some View {
        NavigationStack{
            VStack(alignment: .center) {

                HStack{    Button ("cantidad de productos") {
                    print(model.productList.first)
                    print(model.productList.count)
                }
                    Image(systemName: "printer")
                }
                .buttonStyle(.bordered)
                .padding(.all, 10.0)



                HStack{
                    Button {
                        // cambio de Seleccion
                    } label: {
                        Text("MLFB")
                        Image(systemName: "arrow.up.arrow.down")
                    }.buttonStyle(.bordered)

                    Button {
                        // cambio de Seleccion
                    } label: {
                        Text("Descripcion")
                        Image(systemName: "arrow.up.arrow.down")
                    }.buttonStyle(.bordered)

                    Button {
                        // cambio de Seleccion
                    } label: {
                        Text("Precio")
                        Image(systemName: "dollarsign")
                    }.buttonStyle(.bordered)

                }
                .padding(.all, 10)
                .border(.red, width: 1)
                Text("Texto de marcado list")

                ScrollView {
                    LazyVStack {
                        ForEach(searchResults){ product in
                            if let unwrappedMlfb = product.mlfb {
                                NavigationLink("\(unwrappedMlfb)", value: product)
                            } else {
                                let _ = print(product)
                                Text(product.descripcion ?? "Description")
                            }
                        }
                        .border(.red, width: 1)
                    }
                }
                .navigationDestination(for: Product.self, destination: { selection in
                    Text("You have selected \(selection.mlfb!)")
                })
            }.sheet(isPresented: $showingAddingSheet) {
                AddingNewProduct().environmentObject(model)
            }
            .navigationTitle("APrice4Everything").fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
            .onAppear(perform: {
                if model.productList.isEmpty {
                    model.pullProducts()
                }
            })
            .searchable(text: $searchedProductText)
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
