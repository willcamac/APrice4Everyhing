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
                
                HStack{
                    Button ("cantidad de productos")
                    {
                        print(products[1])
                        print(products.count)
                    }
                    
                    Image(systemName: "printer")
                }                       // Botón de cantidad de productos + impresora.
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
                    
                }                       // Botones para reordenar el listado.
                .padding(.all, 10)
                .border(.red, width: 1)
                Text("Texto de marcado list")
                
//
          
                    ScrollView{
                        LazyVStack{
                            ForEach(filteredProducts){ filteredProduct in
                                NavigationLink(destination: Text("USD \(filteredProduct.precio!)").fontWeight(.heavy)) {   // forced unwrapping para mostrar el precio.
                                    Text("\(filteredProduct.mlfb!)")                                // forced unwrapping para mostrar el mlfb.
                                }
                            }}
                    }
                
               
                
                
                
            }.sheet(isPresented: $showingAddingSheet) {
                AddingNewProduct(products: $products)
            }
            .navigationTitle("APrice4Everything").fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
            .onAppear(perform: {filteredProducts = products})
            .searchable(text: $searchedProduct)
            .onChange(of: searchedProduct) { oldValue, newValue in /// en el momento que se actualice el searchedProduct se refreshea todo el filteredProduct
                
                newValue == "" ? filteredProducts = products : ( /// si el nuevo valor está vacío entonces cargo de toda la relacion, en caso contrario aplico el filtro
                    
                    filteredProducts = products.filter({ product in /// filtraré los product desde products y los cargaré a filteredProducts
                        guard let unwrappedMlfb = product.mlfb  else { /// Desenvuelvo el mlfb de cada uno de los product de products para asegurarme que no es nil
                            print("There was a error unwrapping mlfb") /// Arroja error si es nil y devuelve false
                            return false}
                        
                        return unwrappedMlfb.contains(newValue.uppercased()) ? true : false /// Si es posible desenvolver el mlfb entonces evalúo si contiene el newValue en mayusculas, si cumple devuelve true y se añade al filteredProducts, si no es false y pasa de este.
                    }))
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
