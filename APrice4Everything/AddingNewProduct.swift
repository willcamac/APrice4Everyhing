//
//  AddingNewProduct.swift
//  APrice4Everything
//
//  Created by Wilfredo Camac on 25/02/24.
//

import SwiftUI

struct AddingNewProduct: View {
    @Environment(\.dismiss) var dismiss // dismissea el sheet
    

    
    @State private var newMlfb: String = ""
    @State private var newDescripcion: String = ""
    @State private var newPrecio: String = ""
    @State private var newMoneda: String = "$"
    @State private var newCategoria: String = "0"
    @State private var newSubcategoria: String = ""
    private var categorias = ["0","1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    VStack{
                        Text("MLFB")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3)
                        TextField("Ingresa un nuevo MLFB", text: $newMlfb)}
                }
                
                Section{
                    VStack{
                        Text("Descripción")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3)
                        TextField("Ingresa una descripción del producto", text: $newDescripcion)}
                }
                
                Section{
                    VStack{
                        Text("Precio")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3)
                        TextField("Ingrese un precio", text: $newPrecio)}
                }
                
                Section{
                    VStack{
                        Picker("Elija una categoría", selection: $newCategoria){
                            ForEach(categorias, id: \.self) {
                                Text($0)
                            }
                        }.font(.title3)
                        //                    Text("Categoria")
                        //                        .frame(maxWidth: .infinity, alignment: .leading)
                        //                        .font(.title3)
                        //                    TextField("Elija una categoría", text: $newCategoria)
                    }
                }
                
                Section{
                    VStack{
                        Text("Subcategoría")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3)
                        TextField("Ingrese una subcategoría", text: $newSubcategoria)}
                    
                }
            }
            Button("Ok") {
                //verifica que todos los campos esten llenos, hace dismiss y append el elemento al array
//                let newProduct = Product(mlfb: String?(newMlfb), descripcion: String?(newDescripcion), precio: String?(newPrecio) , moneda: String?(newMoneda), categoria: String?(newCategoria), subcategoria: String?(newSubcategoria))
               // agregar el nuevo producto
            }.navigationTitle("Enter a new product")
                .font(.title)
        }
    }
}

#Preview {
    AddingNewProduct()
}


