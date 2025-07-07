//
//  TransformingOperatorsModel.swift
//  CombineMindset
//
//  Created by Konstantin Pimbursky on 06.07.2025.
//

import Foundation

enum TransformingOperatorsModel: CaseIterable {
    case scan
    case collect
    case mapAndFlatMap
    case replace
    
    var title: String {
        switch self {
        case .scan:
            "scan(_:_:)"
        case .collect:
            "collect()"
        case .mapAndFlatMap:
            "map(_:) and flatMap(_:)"
        case .replace:
            "replace"
        }
    }
}
