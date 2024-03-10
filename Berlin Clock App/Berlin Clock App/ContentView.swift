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
    
    var body: some View {
        ZStack {
            Color
                .background
                .ignoresSafeArea()
            
            VStack (spacing: 0) {
                TopNavText(time: "\(contentViewHour):\(contentViewMinute)")
                ZStack {
                    ClockRoundedRectangle()
                    
                    VStack(spacing: 16){
                        TopCircle()
                        
                        BigBlocksRaw(numderOfTurnedOnLamps: contentViewHour / 5,
                                     normalColor: Color.customRed,
                                     opacityColor: Color.customOpacityRed)
                        
                        BigBlocksRaw(numderOfTurnedOnLamps: contentViewHour % 5,
                                     normalColor: Color.customRed,
                                     opacityColor: Color.customOpacityRed)
                        
                        SmallBlocksRaw(numderOfTurnedOnLamps: contentViewMinute / 5)
                        
                        BigBlocksRaw(numderOfTurnedOnLamps: contentViewMinute % 5,
                                     normalColor: Color.customYellow,
                                     opacityColor: Color.customOpacityYellow)
                    }
                    .padding(.bottom, 32)
                    
                    
                }
                ZStack {
                    InputRoundedRectangle()
                    InputFieldView(selectedHour: $contentViewHour, selectedMinute: $contentViewMinute)
                        .environment(\.locale, Locale(identifier: "ru_RU"))
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct TopNavText: View {
    var time: String
    var body: some View {
        HStack{
            Spacer()
            Text("Time is \(time)")
                .font(.system(size: 17, weight: .semibold))
                .padding(.top, 10)
                .padding(.bottom, 20)
            
            Spacer()
        }
    }
}

struct ClockRoundedRectangle: View {
    var body: some View{
        RoundedRectangle(cornerRadius: 12)
            .frame(width: .infinity, height: 312)
            .foregroundStyle(Color.white)
            .shadow(color: Color.black.opacity(0.05), radius: 14, x: 0, y: 6)
    }
}

struct InputRoundedRectangle: View {
    var body: some View{
        RoundedRectangle(cornerRadius: 12)
            .frame(width: .infinity, height: 54)
            .foregroundStyle(Color.white)
            .shadow(color: Color.black.opacity(0.05), radius: 12, x: 0, y: 6)
            .padding(.top, 10)
    }
}

struct InputFieldView: View {
    @Binding var selectedHour: Int
    @Binding var selectedMinute: Int
    @State private var time = Date()

    var body: some View {
        HStack {
            Text("Insert time")
                .font(.system(size: 18, weight: .medium))
            Spacer()

            DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
                .onChange(of: time) { newTime in
                            let calendar = Calendar.current
                            let components = calendar.dateComponents([.hour, .minute], from: newTime)

                            if let hour = components.hour, let minute = components.minute {
                                selectedHour = hour
                                selectedMinute = minute
                            }
                        }
        }
        .padding(.horizontal, 16)
        .padding(.top, 9)
    }
}


struct TopCircle: View {
    var body: some View {
        Circle()
            .frame(height: 56)
            .foregroundColor(.customYellow)
            .padding(.top, 32)
    }
}

struct BigBlocksRaw: View {
    var numderOfTurnedOnLamps: Int
    var normalColor: Color
    var opacityColor: Color

    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<numderOfTurnedOnLamps, id: \.self) { _ in
                BigBlock(color: normalColor)
            }
            ForEach(0..<4-numderOfTurnedOnLamps, id: \.self) { _ in
                BigBlock(color: opacityColor)
            }
        }
        .padding(.horizontal, 16)
    }
}

struct SmallBlocksRaw: View {
    var numderOfTurnedOnLamps: Int
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<numderOfTurnedOnLamps, id: \.self) { index in
                if (index + 1) % 3 == 0 {
                    SmallBlock(color: Color.customRed)
                }
                else{
                    SmallBlock(color: Color.customYellow)
                }
            }
            ForEach(0..<11-numderOfTurnedOnLamps, id: \.self) { index in
                if (index) % 3 == 0 {
                    SmallBlock(color: Color.customOpacityRed)
                }
                else{
                    SmallBlock(color: Color.customOpacityYellow)
                }
            }
                    
        }
        .padding(.horizontal, 16)
    }
}

struct BigBlock: View {
    var color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .frame(width: .infinity, height: 32)
            .foregroundColor(color)
    }
}

struct SmallBlock: View {
    var color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 2)
            .frame(width: .infinity, height: 32)
            .foregroundColor(color)
    }
}

#Preview {
    ContentView()
}

// Нафигачил все в одном файле чтобы много не бегать а так пожеланию могу раскидать
// Вроде все работает
// С самым верхним текстом вообще не шарю че делать потому что как то не понятно для чего он так как там цыфры с DatePickerem отличаются
// Ну так старался пиксель в пиксель
// Надеюсь ты заметил эту мою гору коментов :)
// Насчет фиолетовых ошибок я их пофиксить не успел, но и с ними работает)))
