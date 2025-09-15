//
//  Looger+Extensions.swift
//  SumNumber
//
//  Created by Thales Araújo on 15/09/25.
//

import Foundation
import os.log

extension Logger {
    init(category: String) {
        self.init(
            subsystem: Bundle.main.bundleIdentifier ?? Bundle.main.description,
            category: category)
    }
}
