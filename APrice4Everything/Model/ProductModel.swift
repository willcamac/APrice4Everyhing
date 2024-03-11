//
//  ProductModel.swift
//  APrice4Everything
//
//  Created by Diego Monteagudo Diaz on 10/03/24.
//

import Foundation

class ProductModel: ObservableObject {
    @Published var productList: [Product] = [Product]()
    @Published private var filteredProducts: [Product] = []

    func pullProducts() {
        productList = Bundle.main.decode("LP2023.json")
    }
    
    func addProduct(product: Product) {
        productList.insert(product, at: 0)
    }

}
