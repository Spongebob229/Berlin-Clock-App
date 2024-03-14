//
//  FourBlocksRaw.swift
//  Berlin Clock App
//
//  Created by Schannikov Timothy on 12.03.2024.
//

import SwiftUI

struct FourBlocksRaw: View {
    var numberOfTurnedOnLamps: Int
    let type: RawType

    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<4, id: \.self) { index in
                Block(color: type.getColor(index: index, numberOfTurnedOnLamps: numberOfTurnedOnLamps), cornerRadius: 4)
            }
        }
        .padding(.horizontal, 16)
    }
}
