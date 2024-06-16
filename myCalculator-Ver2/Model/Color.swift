//
//  Color.swift
//  myCalculator-Ver2
//
//  Created by Kirill Sklyarov on 16.06.2024.
//

import UIKit

enum Color {
    case gray
    case orange
    case blue

    var uiColor: UIColor {
        switch self {
        case .blue: return .systemBlue
        case .gray: return .systemGray
        case .orange: return .systemOrange
        }
    }
}
