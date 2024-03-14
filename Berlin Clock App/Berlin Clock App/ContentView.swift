//
//  ContentView.swift
//  Berlin Clock App
//
//  Created by Schannikov Timothy on 10.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var contentViewHour: Int = 0
    @State private var contentViewMinute: Int = 0
    @State private var contentViewSecond: Int = 0
    
    var body: some View {
        ZStack {
            Color
                .background
                .ignoresSafeArea()
            
            VStack (spacing: 0) {
                
                TopNavText(hours: $contentViewHour, minutes: $contentViewMinute, seconds: $contentViewSecond)
                
                ZStack {
                    ClockRoundedRectangle()
                    
                    VStack(spacing: 16){
                        TopCircle(seconds: $contentViewSecond)
                        
                        FourBlocksRaw(numberOfTurnedOnLamps: contentViewHour / 5, type: .fiveHoursRaw)
                        
                        FourBlocksRaw(numberOfTurnedOnLamps: contentViewHour % 5, type: .oneHoursRaw)
                        
                        ElevenBlocksRaw(numberOfTurnedOnLamps: contentViewMinute / 5, type: .fiveMinutesRaw)
                        
                        FourBlocksRaw(numberOfTurnedOnLamps: contentViewMinute % 5, type: .oneMinutesRaw)
                    }
                    .padding(.bottom, 32)
                }
            
                ZStack {
                    InputRoundedRectangle()
                    InputFieldView(selectedHour: $contentViewHour, selectedMinute: $contentViewMinute, seconds: $contentViewSecond)
                        .environment(\.locale, Locale(identifier: "ru_RU"))
                }
                
                Spacer()
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
