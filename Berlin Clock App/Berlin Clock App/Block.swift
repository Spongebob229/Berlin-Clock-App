//
//  Block.swift
//  Berlin Clock App
//
//  Created by Schannikov Timothy on 14.03.2024.
//
import SwiftUI

struct Block: View {
    var color: Color
    var cornerRadius: CGFloat
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .frame(width: .infinity, height: 32)
            .foregroundColor(color)
    }
}
