//
//  TopNavText.swift
//  Berlin Clock App
//
//  Created by Schannikov Timothy on 12.03.2024.
//

import SwiftUI

struct TopNavText: View {
    @Binding var hours: Int
    @Binding var minutes: Int
    @Binding var seconds: Int
    
    var body: some View {
        HStack {
            Spacer()
            Text("Time is \(padded(hours)):\(padded(minutes)):\(padded(seconds))")
                .font(.system(size: 17, weight: .semibold))
                .padding(.top, 10)
                .padding(.bottom, 20)
            Spacer()
        }
    }
    
    private func padded(_ number: Int) -> String {
        return number < 10 ? "0\(number)" : "\(number)"
    }
}
