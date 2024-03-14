//
//  RawType.swift
//  Berlin Clock App
//
//  Created by Schannikov Timothy on 12.03.2024.
//

import SwiftUI

enum RawType {
    case fiveHoursRaw
    case oneHoursRaw
    case oneMinutesRaw
    case fiveMinutesRaw
    
    func getColor(index: Int, numberOfTurnedOnLamps: Int) -> Color {
        switch self {
        case .fiveHoursRaw, .oneHoursRaw:
            return index < numberOfTurnedOnLamps ? Color.selectedRed : Color.unselectedRed
        case .oneMinutesRaw:
            return index < numberOfTurnedOnLamps ? Color.selectedYellow : Color.unselectedYellow
        case .fiveMinutesRaw:
            if index < numberOfTurnedOnLamps {
                return (index + 1) % 3 == 0 ? Color.selectedRed : Color.selectedYellow
            }
            else {
                return (index + 1) % 3 == 0 ? Color.unselectedRed : Color.unselectedYellow
            }
        }
    }
}


