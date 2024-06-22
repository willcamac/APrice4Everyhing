//
//  Product.swift
//  APrice4Everything
//
//  Created by Wilfredo Camac on 8/02/24.
//

import Foundation
import SwiftData



class Product: Identifiable, Codable, Hashable, Equatable { // Se agregan los protocolos Hashable && Equatable
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
    
    init(mlfb: String? = nil, descripcion: String? = nil, precio: String? = nil, moneda: String? = nil, categoria: String? = nil, subcategoria: String? = nil) {
        self.mlfb = mlfb
        self.descripcion = descripcion
        self.precio = precio
        self.moneda = moneda
        self.categoria = categoria
        self.subcategoria = subcategoria
    }
}
    

