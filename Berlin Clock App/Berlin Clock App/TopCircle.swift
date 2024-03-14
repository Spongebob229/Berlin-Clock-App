//
//  TopCircle.swift
//  Berlin Clock App
//
//  Created by Schannikov Timothy on 12.03.2024.
//

import SwiftUI

struct TopCircle: View {
    @Binding var seconds: Int
    
    var body: some View {
        Circle()
            .frame(height: 56)
            .foregroundColor(seconds % 2 == 0 ? .selectedYellow : .unselectedYellow)
            .padding(.top, 32)
    }
}
