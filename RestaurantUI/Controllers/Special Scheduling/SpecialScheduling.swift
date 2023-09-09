//
//  SpecialScheduling.swift
//  RestaurantUI
//
//  Created by Ali Tamoor on 02/09/2023.
//

import SwiftUI

struct SpecialScheduling: View {
    var events = [
        Event(eventName: "Sad Hour", startTime: "8:00am", endTime: "12:00am"),
        Event(eventName: "Happy Hour", startTime: "5:00pm", endTime: "7:00pm")
    ]
    var body: some View {
        
        //        ScheduleView(day: events[0])
        ScrollView() {
            VStack(alignment: .leading) {
                
                Text("Special Scheduling")
                    .font(
                        Font.custom("Lato-Semibold", size: 25)
                    )
                    .bold()
                    .foregroundColor(Color("TertiaryBG"))
                VStack {
                    ForEach(1..<8, id: \.self) { dayIndex in
                        DayView(day: weekdayName(for: dayIndex), events: events)
                            .padding(.bottom,50)
                    }
                }
                //                .ignoresSafeArea()
                //                .background(Color("PrimaryBG"))
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .foregroundColor(Color("White"))
        .background(content: {
            Color("PrimaryBG")
        })
        .cornerRadius(20)
    }
    
    func weekdayName(for index: Int) -> String {
        let calendar = Calendar.current
        let weekdaySymbols = calendar.shortWeekdaySymbols
        let adjustedIndex = (index - 1 + calendar.firstWeekday) % 7
        return weekdaySymbols[adjustedIndex]
    }
}


struct Event:Identifiable {
    var id = UUID()
    var eventName: String
    var startTime: String
    var endTime: String
}

struct SpecialScheduling_Previews: PreviewProvider {
    static var previews: some View {
        SpecialScheduling()
    }
}

struct DayView: View {
    var day: String
    var events: [Event]
    var body: some View {
        HStack(alignment: .top) {
            Text("\(day):")
                .font(
                    Font.custom("Lato-Bold", size: 15)
                )
                .foregroundColor(Color("TertiaryBG"))
            
            
            VStack {
                ForEach(events) { event in
                    ScheduleView(day: event)
                }
//                .padding(.bottom)
                
                Button {
                    
                } label: {
                    Image("addButton2")
                        .padding(.top, 5)
                }
            }
        }
        .shadow(color: .black.opacity(0.28), radius: 12.5, x: 0, y: 4)
    }
}

struct ScheduleView: View {
    var day: Event
    var body: some View {
        VStack(alignment: .leading) {
            DropDownButton(title: day.eventName, fontSize: 15.0, alignment: .center)
                .frame(width: 160)
                .shadow(color: .black.opacity(0.28), radius: 8.5, x: 0, y: 4)
            HStack {
                Text("From: ")
                Text(day.startTime)
                    .padding(5)
                    .padding(.horizontal,10)
                    .foregroundColor(Color("PrimaryBG"))
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.28), radius: 7.5, x: 0, y: 4)
                
                Text("To: ")
                Text(day.endTime)
                    .padding(5)
                    .padding(.horizontal,10)
                    .foregroundColor(Color("PrimaryBG"))
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.28), radius: 7.5, x: 0, y: 4)
            }
            .padding(.trailing)
            .font(
                Font.custom("Lato-Bold", size: 15)
            )
            .foregroundColor(.white)
        }
        .padding(.bottom,17)
    }
}
