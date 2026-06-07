//
//  Units.swift
//  allo-feeder
//
//  Created by Benjamin Wright on 07/06/2026.
//

import Foundation

enum UnitKind : Int16 {
    case Count = 0
    case Volume = 1
    case Weight = 2
}

extension Unit {
    var unitKind: UnitKind? {
        get {
            return UnitKind(rawValue: kind)
        }
        set {
           kind = newValue?.rawValue ?? 0
        }
    }
}
