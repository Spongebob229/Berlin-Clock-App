//
//  ClockRoundedRectangle.swift
//  Berlin Clock App
//
//  Created by Schannikov Timothy on 12.03.2024.
//

import SwiftUI

struct ClockRoundedRectangle: View {
    var body: some View{
        RoundedRectangle(cornerRadius: 12)
            .frame(width: .infinity, height: 312)
            .foregroundStyle(Color.white)
            .shadow(color: Color.black.opacity(0.05), radius: 14, x: 0, y: 6)
    }
}
