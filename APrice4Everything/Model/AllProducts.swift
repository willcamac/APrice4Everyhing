//
//  Products.swift
//  APrice4Everything
//
//  Created by Wilfredo Camac on 2/05/24.
//

import Foundation
import SwiftUI

//
//class Products: ObservableObject {
//    @Published var products : [Product] = Bundle.main.decode("LP2023.json")
//}


class AllProducts: ObservableObject {
    @Published var allProducts: [Product] =  Bundle.main.decode("LP2023.json") // uso @Published para enviarlo al Enviroment

//    init(products: [Product]) {
//        self.products = products
//    }
    
}
    
