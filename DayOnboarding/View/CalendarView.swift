import SwiftUI

struct CalendarView: View {
    
    @State private var date = Date.now
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    @State private var days: [Date] = []
    
    var body: some View {
        VStack{
            LabeledContent("Date/Time"){
                DatePicker("", selection: $date)
            }
            HStack{
                ForEach(daysOfWeek.indices, id: \.self){index in
                        Text(daysOfWeek[index])
                        .fontWeight(.black)
                        .foregroundColor(.kBlue)
                        .frame(maxWidth: .infinity)
                }
            }
            LazyVGrid(columns: columns){
                ForEach(days, id: \.self){day in
                    if day.monthInt != date.monthInt{
                        Text("")
                    }else{
                        Text(day.formatted(.dateTime.day()))
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(
                                Circle()
                                    .foregroundStyle(
                                        Date.now.startOfDay == day.startOfDay
                                        ? .kRed.opacity(0.3)
                                        : .blue.opacity(0.3))
                            )
                    }
                }
            }
        }
        .padding(.horizontal, 18)
        .onAppear{
            days = date.calendarDisplayDays
        }
        .onChange(of: date){
            days = date.calendarDisplayDays
        }
    }
}

#Preview {
    CalendarView()
}
