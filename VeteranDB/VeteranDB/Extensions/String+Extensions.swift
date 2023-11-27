//
//  String+Extensions.swift
//  VeteranDB
//
//  Created by Thomas Cowern on 11/8/23.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

