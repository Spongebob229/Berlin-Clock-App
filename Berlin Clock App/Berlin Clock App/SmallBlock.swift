//
//  SmallBlock.swift
//  Berlin Clock App
//
//  Created by Schannikov Timothy on 12.03.2024.
//

import SwiftUI

struct SmallBlock: View {
    var color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 2)
            .frame(width: .infinity, height: 32)
            .foregroundColor(color)
    }
}
