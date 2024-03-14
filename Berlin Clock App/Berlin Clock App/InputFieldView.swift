//
//  InputFieldView.swift
//  Berlin Clock App
//
//  Created by Schannikov Timothy on 12.03.2024.
//

import SwiftUI

struct InputFieldView: View {
    @Binding var selectedHour: Int
    @Binding var selectedMinute: Int
    @Binding var seconds: Int // Make seconds a @Binding variable
    @State private var time = Date()
    
    var body: some View {
        HStack {
            Text("Insert time")
                .font(.system(size: 18, weight: .medium))
            Spacer()
            
            VStack {
                DatePicker("", selection: $time, displayedComponents: [.hourAndMinute])
                    .onChange(of: time) { newTime in
                        let calendar = Calendar.current
                        let components = calendar.dateComponents([.hour, .minute, .second], from: newTime)
                        if let hour = components.hour, let minute = components.minute, let newSeconds = components.second {
                            selectedHour = hour
                            selectedMinute = minute
                            seconds = newSeconds // Update seconds with new value
                        }
                    }
                
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 9)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                seconds += 1
                if seconds == 60 {
                    seconds = 0
                    selectedMinute += 1
                    
                    if selectedMinute == 60 {
                        selectedMinute = 0
                        selectedHour += 1
                        
                        if selectedHour == 24 {
                            selectedHour = 0
                        }
                    }
                }
            }
        }
        .onDisappear {
            seconds = 0
        }
    }
}

