//
//  AddingNewProduct.swift
//  APrice4Everything
//
//  Created by Wilfredo Camac on 25/02/24.
//

import SwiftUI

struct AddingNewProduct: View {
    @EnvironmentObject
    private var model: ProductModel
    @Environment(\.dismiss) var dismiss // dismissea el sheet

    @State var newMlfb: String = ""
    @State var newDescripcion: String = ""
    @State var newPrecio: String = ""
    @State var newMoneda: String = "$"
    @State var newCategoria: String = "0"
    @State var newSubcategoria: String = ""
    var categorias = ["0","1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
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
                let newProduct = Product(mlfb: newMlfb, descripcion: newDescripcion, precio: newPrecio, moneda: newMoneda, categoria: newCategoria, subcategoria: newSubcategoria)
                model.addProduct(product: newProduct)
                // Se agrega el nuevo producto al array de productos.
                
                dismiss()
                //verifica que todos los campos esten llenos, hace dismiss y append el elemento al array
//                let newProduct = Product(mlfb: String?(newMlfb), descripcion: String?(newDescripcion), precio: String?(newPrecio) , moneda: String?(newMoneda), categoria: String?(newCategoria), subcategoria: String?(newSubcategoria))
               // agregar el nuevo productor
            }.navigationTitle("Enter a new product")
                .font(.title)
        }
    }
}

#Preview {
    AddingNewProduct().environmentObject(ProductModel())
}


