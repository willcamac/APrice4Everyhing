//
//  Product.swift
//  APrice4Everything
//
//  Created by Wilfredo Camac on 8/02/24.
//

import Foundation
import SwiftUI

class Product: Identifiable, Codable {
    let id = UUID()
    var mlfb: String?
    var descripcion: String?
    var precio: String?
    var moneda: String?
    var categoria: String?
    var subcategoria: String?
    
    init(mlfb: String? = nil, descripcion: String? = nil, precio: String? = nil, moneda: String? = nil, categoria: String? = nil, subcategoria: String? = nil) {
        self.mlfb = mlfb
        self.descripcion = descripcion
        self.precio = precio
        self.moneda = moneda
        self.categoria = categoria
        self.subcategoria = subcategoria
    }
}
    
class AllProducts: ObservableObject {
    @Published var products: [Product]

    init(products: [Product]) {
        self.products = products
    }
    
}
