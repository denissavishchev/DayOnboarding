import SwiftUI

struct ComponentsView: View {
   
    var body: some View {
        NavigationStack{
            VStack {
                DaySwitch()
                
                TodaysPlansView()
                
                HabitView()
                
                    HStack(alignment: .bottom, spacing: 20){
                        NavigationButton(text: "One", destination: AnyView(RecomendationsView()))
                        NavigationButton(text: "Calendar", destination: AnyView(CalendarView()))
                        AddTaskView()
                        NavigationButton(text: "Recomendations", destination: AnyView(RecomendationsView()))
                        NavigationButton(text: "Four", destination: AnyView(RecomendationsView()))
                    }
                    .frame(maxWidth: .infinity)
                    .background(.kDark)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.kDark)
        }
        
    }
        
}

#Preview {
    ComponentsView()
}


struct NavigationButton: View {
    
    let text: String
    let destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination){
            ZStack{
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.kDark)
                    .shadow(color: .white.opacity(0.4), radius: 2, y: 2)
                    .overlay{
                        Text(text)
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(.kGrayLight)
                    }
            }
            .frame(width: 60, height: 30)
            .background(.kDark)
        }
        
    }
}



