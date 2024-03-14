//
//  InputRoundedRectangle.swift
//  Berlin Clock App
//
//  Created by Schannikov Timothy on 12.03.2024.
//

import SwiftUI

struct InputRoundedRectangle: View {
    var body: some View{
        RoundedRectangle(cornerRadius: 12)
            .frame(width: .infinity, height: 54)
            .foregroundStyle(Color.white)
            .shadow(color: Color.black.opacity(0.05), radius: 12, x: 0, y: 6)
            .padding(.top, 10)
    }
}
