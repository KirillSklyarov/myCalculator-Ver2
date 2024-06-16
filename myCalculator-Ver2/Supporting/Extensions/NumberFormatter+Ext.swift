//
//  NumberFormatter+Ext.swift
//  myCalculator-Ver2
//
//  Created by Kirill Sklyarov on 16.06.2024.
//

import Foundation

extension NumberFormatter {

    static var appFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 4
        return formatter
    }()
}
