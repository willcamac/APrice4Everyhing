//
//  Product.swift
//  APrice4Everything
//
//  Created by Wilfredo Camac on 8/02/24.
//

import Foundation
import SwiftUI

struct Product: Identifiable, Codable, Hashable, Equatable { // Se agregan los protocolos Hashable && Equatable
    static func == (lhs: Product, rhs: Product) -> Bool { // static func necesaria to conform to Equatable Protocol
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    var mlfb: String?
    var descripcion: String?
    var precio: String?
    var moneda: String?
    var categoria: String?
    var subcategoria: String?
    
    func hash(into hasher: inout Hasher){ // func necesaria to conform to Hashable Protocol
        hasher.combine(id)
        hasher.combine(mlfb)
        hasher.combine(descripcion)
    }
}
    
class AllProducts: ObservableObject {
    @Published var products: [Product] = [] // uso @Published para enviarlo al Enviroment

//    init(products: [Product]) {
//        self.products = products
//    }
    
}
