//
//  String+extensions.swift
//  APrice4Everything
//
//  Created by Diego Monteagudo Diaz on 10/03/24.
//

import Foundation

extension String {
    func validateString() -> String? {
        return self.isEmpty ? nil : self
    }
}
